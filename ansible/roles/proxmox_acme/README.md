# Proxmox ACME Role

## This role needs some work, as there is quite a bit more manual effort needed than I would like at this point

This role:
1. Writes the Cloudflare API token to a secure file.
2. Registers an ACME account for Let's Encrypt.
3. Configures the Cloudflare DNS-01 plugin.
4. Requests/renews the Proxmox node certificate.

## Example Usage
```yaml
---
# Cluster-aware ACME configuration for all Proxmox nodes
# Run with:
#   ansible-playbook playbooks/proxmox_acme.yml --ask-vault-pass
# or export CF_ACME_TOKEN from Terraform output

- name: Configure ACME and Cloudflare DNS plugin on all Proxmox nodes
  hosts: proxmox
  become: true
  gather_facts: false

  vars_files:
    # Vaulted file that contains acme_email or any other long-term secrets
    - ../group_vars/proxmox/vault.yml

  roles:
    - role: proxmox_acme

  serial: 1 # One node at a time to prevent cluster lock contention
  any_errors_fatal: true
