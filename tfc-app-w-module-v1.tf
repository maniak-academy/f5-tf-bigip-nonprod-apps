module "tfc-app-w-module-v1" {
  source              = "../terraform-bigip-app"
  version             = "1.0.5"
  tenant              = "tfc-app-w-module-v1"
  common_name         = "tfc-app-w-module-v1.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.200"
  pki_name            = "maniak-dot-academy"
  namespace           = "admin/network"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["10.11.6.1", "10.11.6.2", "10.11.6.3"]
}

