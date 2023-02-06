module "tfc-app-w-module-v4" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.5"
  tenant              = "app-dev4"
  common_name         = "app-dev4.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.204"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["10.11.6.1", "10.11.6.2"]
}

