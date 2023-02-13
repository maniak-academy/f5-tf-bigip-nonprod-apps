module "virtualserver" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "virtualserver"
  common_name         = "virtualserver.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.209"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.1", "172.16.100.2"]
}