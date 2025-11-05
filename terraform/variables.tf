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

variable "account_id" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "cf_admin_api_token" {
  type      = string
  sensitive = true
}

variable "domain_name" {
  description = "The domain name managed in Cloudflare"
  type        = string
}

variable "allowed_ip_ranges" {
  description = "List of CIDR ranges allowed to use the token"
  type        = list(string)
  default     = []
}