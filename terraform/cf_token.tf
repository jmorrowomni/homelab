data "cloudflare_zones" "selected" {
  account = {
    id = var.account_id
  }
}

# # Fetch all permission group IDs
data "cloudflare_api_token_permission_groups_list" "all" {
}

data "http" "my_ip" {
  url = "https://ipv4.icanhazip.com"
}

# data "cloudflare_permission_groups" "dns_edit" { name_contains = "Zone.DNS" }

locals {
  my_ip   = trim(data.http.my_ip.response_body, "\n")
  zone_id = data.cloudflare_zones.selected.result[0].id

  zone_permissions = {
    for perm in data.cloudflare_api_token_permission_groups_list.all.result :
    perm.name => perm.id
    if contains(perm.scopes, "com.cloudflare.api.account.zone")
  }
}

resource "cloudflare_api_token" "acme_dns" {
  name = "acme-dns-token"

  policies = [{
    effect = "allow"

    # Use permission group ID from the data source
    permission_groups = [

      { id = local.zone_permissions["DNS Write"] },
      { id = local.zone_permissions["Zone Read"] },

    ]

    # Grant access to one zone
    resources = {
      "com.cloudflare.api.account.zone.${local.zone_id}" = "*"
    }
  }]

  condition = {
    request_ip = {
      in = concat(var.allowed_ip_ranges, ["${local.my_ip}/32"])
    }
  }
}

# output "acme_dns_token" {
#   value     = cloudflare_api_token.acme_dns.value
#   sensitive = true
# }

