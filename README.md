# homelab
This is a rework of my initial go at a homelab.  The intent is to have as much managed via Infrastructure as Code (IaC) as possible.

# Infrastructure

 Cluster information - 2 nodes
  -------------------
  - **Name:**             xmen
  
  Node 1
  -------------------

- **Hostname:** wolverine
- **Proxmox Version:** pve-manager/9.0.11/3bf5476b8a4699e2 (running kernel: 6.14.11-4-pve)
- **Kernel:** 6.14.11-4-pve
- **Hardware Model:** Dell Inc. OptiPlex 7010 (Board: 0773VG)
- **CPU:** Intel(R) Core(TM) i7-3770 CPU @ 3.40GHz (8 cores)
- **RAM:** 15Gi
- **Storage:**
  - local: active used of dir
  - local-lvm: active used of lvmthin
- **Cluster Status:**
  
- **VMs:**
- **LXC Containers:**
  - Development Server


Node 2
  -------------------

- **Hostname:** wolverine
- **Proxmox Version:** pve-manager/9.0.3/025864202ebb6109 (running kernel: 6.14.8-2-pve)
- **Kernel:** 6.14.8-2-pve
- **Hardware Model:** ASUS System Product Name (Board: PRIME B550M-A WIFI II)
- **CPU:** AMD Ryzen 5 5600G with Radeon Graphics (12 cores)
- **RAM:** 30Gi
- **Storage:**
  - local: active used of dir
  - local-lvm: active used of lvmthin

- **VMs:**
  - podman (running)
- **LXC Containers:**
  - Nextcloud (Need to migrate to docker with separate containers)
  - Adguard


# Technology
The technologies currently in use are:

* Terraform
* Ansible
* Podman
* Docker
* Wireguard
* CloudFlare Tunnels
* Lets Encrypt

# To-Do List 
  This list is not comprehensive, as I'm sure I'm not thinking of things
  - [ ] Configure certificate management
    - [x] Configure certs for Proxmox nodes
    - [ ] Configure certs for services
  - [ ] Deploy Vaultwarden
  - [ ] Deploy HomeAssistant
  - [ ] Deploy Immich
  - [ ] Deploy Unifi
  - [ ] Deploy Kubernetes (https://www.tauceti.blog/posts/kubernetes-the-not-so-hard-way-with-ansible-the-basics/)
  - [ ] Convert some container images into Kubernetes pods
  - [ ] Deploy service mesh (Istio most likely)
  - [ ] Configure Helm charts
