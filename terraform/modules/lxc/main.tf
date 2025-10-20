terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

locals {
  ssh_key = trimspace(file(var.ssh_public_key_path))
  vm_ip   = split("/", var.ip_address)[0]
}

resource "proxmox_virtual_environment_container" "proxmox_lxc" {
  vm_id       = var.vmid
  node_name   = var.target_node
  description = "Terraform-managed LXC container"
  tags        = ["terraform"]

  unprivileged = true

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.ip_gateway
      }
    }

    user_account {
      keys = [file("${var.ssh_public_key_path}")]
    }



  }
  network_interface {
    name = "veth0"
  }

  operating_system {
    template_file_id = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
    type             = "ubuntu"
  }

  memory {
    dedicated = 1024
  }

  cpu {
    cores = 2
  }

  disk {
    datastore_id = "local-lvm"
    size         = 8
  }

  features {
    nesting = true
    #    keyctl  = true
  }

  start_on_boot = true
}

# Wait until SSH is up
resource "null_resource" "wait_for_ssh" {
  provisioner "remote-exec" {
    inline = ["/usr/bin/cloud-init status --wait; echo ${var.hostname} is online at ${local.vm_ip}!"]

    connection {
      agent       = false
      host        = local.vm_ip
      private_key = file(var.ssh_private_key_path)
      type        = "ssh"
      user        = "root"
    }
  }
  depends_on = [proxmox_virtual_environment_container.proxmox_lxc]
}


# Install Docker or Podman inside the LXC
resource "null_resource" "install_container_runtime" {
  depends_on = [null_resource.wait_for_ssh]

  connection {
    type        = "ssh"
    user        = "root"
    host        = "192.168.5.${var.vmid}"
    private_key = file(var.ssh_private_key_path)
  }

  # Choose between no runtime, Docker, or Podman

  provisioner "remote-exec" {
    inline = concat(
      [
        "apt update -y",
        "apt install -y curl ca-certificates apt-transport-https software-properties-common"
      ],
      var.install_runtime == "docker" ? [
        "curl -fsSL https://get.docker.com | sh",
        "systemctl enable docker",
        "systemctl start docker"
      ] : [],
      var.install_runtime == "podman" ? [
        "apt install -y podman",
        "systemctl enable podman.socket || true"
      ] : []
    )
  }
}
