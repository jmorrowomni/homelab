variable "ssh_public_key_path" {
  type = string
}

variable "ssh_private_key_path" {
  type = string
}

variable "hostname" {
  type = string
}

variable "vmid" {
  type    = number
  default = null
}

variable "force" {
  type = bool
  default = false
}

variable "ssh_user" {
  type    = string
  default = "root"
}

variable "password" {
  type    = string
  default = null
}

variable "target_node" {
  type    = string
  default = "pve"
}

variable "pool" {
  type    = string
  default = null
}

variable "cores" {
  type    = number
  default = 1
}

variable "memory_mb" {
  type    = number
  default = 2048
}

variable "root_disk_size" {
  type    = string
  default = "16G"
}

variable "root_disk_pve_storage" {
  type    = string
  default = "local-lvm"
}

variable "mount_storage" {
  description = "A string containing the volume , directory, or device to be mounted into the containervalue"
  type        = string
  default     = null
}

variable "mount_point" {
  description = "The path to the mount point as seen from inside the container. The path must not contain symlinks for security reasons.value"
  type        = string
  default     = null
}

variable "mount_size" {
  description = "size of the underlying volume. Must end in G, M, or K (e.g. 1G, 1024M, 1048576K). Note that this is a read only value.value"
  type        = string
  default     = null
}

variable "ip_address" {
  description = "ip_address/CIDR"
  type        = string
}

variable "ip_gateway" {
  description = "ip_address of gateway"
  type        = string
}

variable "vlan_id" {
  type        = number
  description = "(optional) describe your variable"
  default     = null
}

variable "template" {
  description = "Name of the template to clone from. Can be found with: `sudo pveam list local`"
  type        = string
  default     = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "onboot" {
  type    = bool
  default = true
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "install_runtime" {
  description = "Which container runtime to install (docker, podman, or none)"
  type        = string
  default     = "none"
}