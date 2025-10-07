module "podman" {

  source = "./modules/vm"

  name = "podman"

  template_vm_id = 100
  vm_id          = 201

  cores = 1

  memory_mb = 2048

  root_disk_size        = 32
  root_disk_pve_storage = "local-lvm"

  data_disk_size        = "1"
  data_disk_pve_storage = "local-lvm"
  data_disk_format      = "raw"

  vm_ip_address = "192.168.5.201/24"
  vm_ip_gateway = "192.168.5.1"
  dns_servers   = ["192.168.5.111"]

  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_key_path  = var.ssh_public_key_path
}


  