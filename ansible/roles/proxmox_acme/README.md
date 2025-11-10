# Proxmox ACME Role

This role:
1. Writes the Cloudflare API token to a secure file.
2. Registers an ACME account for Let's Encrypt.
3. Configures the Cloudflare DNS-01 plugin.
4. Requests/renews the Proxmox node certificate.

## Example Usage
```yaml
- hosts: proxmox
  become: true
  roles:
    - role: proxmox_acme
      vars:
        acme_email: "admin@example.com"
        cf_acme_token: "{{ lookup('env','CF_ACME_TOKEN') }}"
