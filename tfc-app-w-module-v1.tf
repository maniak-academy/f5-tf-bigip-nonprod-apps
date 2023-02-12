module "tfc-app-w-module-v1" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.5"
  tenant              = "tfc-app-w-module-v1"
  common_name         = "tfc-app-w-module-v1.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.200"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.1", "172.16.100.2", "172.16.100.3"]
}


module "demo-app1" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "demo-app1"
  common_name         = "demo-app1.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.202"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.4", "172.16.100.5"]
}
