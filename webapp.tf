module "webapp1" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "webapp1"
  common_name         = "webapp1.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.205"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.6", "172.16.100.5"]
}

module "webapp2" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "webapp2"
  common_name         = "webapp2.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.210"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.1", "172.16.100.2", "172.16.100.3"]
}
