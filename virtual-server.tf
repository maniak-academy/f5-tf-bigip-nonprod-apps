module "mainwebfront" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "mainwebfront"
  common_name         = "mainwebfront.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.100"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.1", "172.16.100.2"]
}

module "mainwebbackend" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "mainwebbackend"
  common_name         = "mainwebbackend.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.101"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.3", "172.16.100.4", "172.16.1.5"]
}