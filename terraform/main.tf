provider "proxmox" {

  endpoint  = var.pm_api_url
  api_token = "${var.pve_token_id}=${var.pve_token_secret}"
  insecure  = true

}
