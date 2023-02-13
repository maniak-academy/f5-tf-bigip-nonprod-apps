module "webfront" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "webfront"
  common_name         = "webfront.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.200"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.5", "172.16.100.6"]
}

module "backend" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "backend"
  common_name         = "backend.maniak.academy"
  as3tmpl             = "https"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.250"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "80"
  monitor             = "http"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.1", "172.16.100.2", "172.16.100.3"]
}


module "webapp2" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "webapp2"
  common_name         = "webapp2.maniak.academy"
  as3tmpl             = "https"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.210"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "80"
  monitor             = "http"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.3", "172.16.100.5"]
}
