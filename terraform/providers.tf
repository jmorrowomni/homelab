terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.84.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.12.0"
    }
  }
}