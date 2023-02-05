# module "tfc-app-w-module-v3" {
#   source              = "sebbycorp/app/bigip"
#   version             = "1.0.6"
#   tenant              = "tfc-app-w-module-v3"
#   common_name         = "tfc-app-w-module-v3.maniak.academy"
#   as3tmpl             = "shttps"
#   vault_pki_backend   = "pki_int"
#   vip_address         = "192.168.57.203"
#   pki_name            = "maniak-dot-academy"
#   pool_members_port   = "443"
#   namespace           = "admin/network"
#   monitor             = "https"
#   load_balancing_mode = "least-connections-member"
#   pool_members        = ["10.11.6.1", "10.11.6.2"]
# }

