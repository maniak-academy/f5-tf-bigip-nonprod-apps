module "internallb" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "internallb"
  common_name         = "internallb.maniak.academy"
  as3tmpl             = "https"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.238"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "80"
  monitor             = "http"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.1", "172.16.100.2", "172.16.100.3"]
}