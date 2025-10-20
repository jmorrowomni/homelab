variable "pm_api_url" {
  type      = string
  sensitive = true
}

variable "pm_user" {
  default = null
}
variable "pm_password" {
  default = null
}

variable "ssh_public_key_path" {
  description = "Public key for created user"
  sensitive   = true
}

variable "ssh_private_key_path" {
  description = "Private key for created user"
  sensitive   = true
}

variable "pve_token_id" {
  description = "Proxmox API Token Name"
  sensitive   = true
}

variable "pve_token_secret" {
  description = "Proxmox API Token Value"
  sensitive   = true
}

variable "bios" {
  type    = string
  default = "seabios"
}