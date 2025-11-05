terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

locals {
  ssh_key = trimspace(file(var.ssh_public_key_path))
  vm_ip   = split("/", var.vm_ip_address)[0]
}

resource "proxmox_virtual_environment_vm" "proxmox_vm" {

  name      = var.name
  node_name = var.target_node
  vm_id     = var.vm_id

  clone {
    vm_id = var.template_vm_id
  }

  agent {
    enabled = true
  }

  memory {
    dedicated = 768
  }

  initialization {
    interface    = "scsi2"
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = var.vm_ip_address
        gateway = var.vm_ip_gateway
      }
    }

    user_account {
      keys = [file("${var.ssh_public_key_path}")]
    }
  }

  lifecycle {
    ignore_changes = [
      initialization[0].user_account[0].keys
    ]
  }

  provisioner "remote-exec" {
    inline = ["/usr/bin/cloud-init status --wait; echo ${var.name} is online at ${local.vm_ip}!"]

    connection {
      agent       = false
      host        = local.vm_ip
      private_key = file(var.ssh_private_key_path)
      type        = "ssh"
      user        = "ubuntu"
    }
  }
}

resource "null_resource" "ssh_known_hosts" {

  triggers = {
    id   = proxmox_virtual_environment_vm.proxmox_vm.id
    name = proxmox_virtual_environment_vm.proxmox_vm.name
  }
  provisioner "local-exec" {
    environment = {
      host_ip = local.vm_ip
    }

    command = "/bin/bash ${path.module}/scripts/known_hosts.sh ${local.vm_ip}"
  }

  depends_on = [
    proxmox_virtual_environment_vm.proxmox_vm
  ]

}

