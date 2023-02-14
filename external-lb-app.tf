module "external-lb-web" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "external"
  common_name         = "external-web.maniak.academy"
  as3tmpl             = "https"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.230"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "80"
  monitor             = "http"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["172.16.100.1", "172.16.100.2","172.16.100.3"]
}