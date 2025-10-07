output "vm_id" {
  value = proxmox_virtual_environment_vm.proxmox_vm.vm_id
}

output "vm_name" {
  value = proxmox_virtual_environment_vm.proxmox_vm.name
}

output "ip" {
  value = proxmox_virtual_environment_vm.proxmox_vm.id
}

output "ipv4_ip" {
  value = proxmox_virtual_environment_vm.proxmox_vm.ipv4_addresses
}