module "www.webapp1.com" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.9"
  tenant              = "www.webapp1.com"
  common_name         = "www.webapp1.com.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "192.168.57.280"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["10.11.9.1", "10.11.9.2", "10.11.9.3"]
}
