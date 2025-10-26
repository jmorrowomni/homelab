variable "ssh_public_key_path" {
  description = "Public key for created user"
  sensitive   = true
}

variable "ssh_private_key_path" {
  description = "Private key for created user"
  sensitive   = true
}

variable "name" {
  type = string
}

variable "target_node" {
  type    = string
  default = "gambit"
}

variable "pool" {
  type    = string
  default = null
}

variable "cores" {
  type = number
}

variable "memory_mb" {
  type = number
}

variable "root_disk_size" {
  description = "Size of the root data disk in GB"
  type        = number
}

variable "root_disk_pve_storage" {
  type = string
}

variable "data_disk_size" {
  description = "size of the data disk in GB"
  type        = number
  default     = 1
}

variable "data_disk_type" {
  type    = string
  default = "scsi"
}

variable "data_disk_format" {
  type    = string
  default = "raw"
}

variable "data_disk_pve_storage" {
  type    = string
  default = "local-zfs"
}

variable "data_disk_is_ssd" {
  type    = bool
  default = true
}

variable "dns_servers" {
  type = list(string)
}

variable "vm_ip_address" {
  description = "ip_address/CIDR"
  type        = string
}

variable "vm_ip_gateway" {
  description = "ip_address of gateway"
  type        = string
}

variable "create_vm_secondary_interface" {
  description = "Boolean flag to indicate whether a secondary network interface should be created on the VM."
  type        = bool
  default     = false
}

variable "vm_secondary_ip_address" {
  description = "Secondary IP address for the secondary network interface (ip_address/CIDR)"
  type        = string
  default     = null
}

variable "vm_secondary_ip_gateway" {
  description = "Gateway IP for the secondary network interface"
  type        = string
  default     = null
}

variable "template_vm_id" {
  type = number
}

variable "full_clone" {
  type    = bool
  default = true
}

variable "onboot" {
  type    = bool
  default = true
}

variable "agent_enabled" {
  type    = bool
  default = true
}

variable "bios_type" {
  type    = string
  default = "seabios"
}

variable "usb_passthrough" {
  type = map(object({
    mapping = string
    usb3    = bool
  }))
  default = {}
}

variable "pci_passthrough" {
  type = map(object({
    device = string
    id     = string
    pcie   = bool
    rombar = bool
    xvga   = bool
  }))
  default = {}
}

variable "machine_type" {
  type    = string
  default = null
}

variable "vm_id" {
  type    = number
  default = null
}

variable "efi_datastore" {
  type    = string
  default = "local-lvm"
}

variable "efi_file_format" {
  type    = string
  default = "raw"
}

variable "efi_type" {
  type    = string
  default = "4m"
}

variable "root_disk_cache" {
  type    = string
  default = "writeback"
}