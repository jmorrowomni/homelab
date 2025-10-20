module "proxmox_lxc" {

  source = "./modules/lxc"

  vmid                 = 202
  hostname             = "adguard"
  target_node          = "pve2"
  ssh_public_key_path  = var.ssh_public_key_path
  ssh_private_key_path = var.ssh_private_key_path

  ip_address = "192.168.5.202/24"
  ip_gateway = "192.168.5.1"

  install_runtime = "docker"
}