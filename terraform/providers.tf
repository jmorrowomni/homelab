terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.81.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.virtual_environment_endpoint

  # Choose one authentication method:
  api_token = var.virtual_environment_api_token
}