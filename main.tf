terraform {
  cloud {
    organization = "sebbycorp"

    workspaces {
      name = "f5-tf-bigip-nonprod-apps"
    }
  }
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.15.1"
    }
  }
}


provider "vault" {
  address = "https://vault-maniak-public-vault-41264194.d96179f0.z1.hashicorp.cloud:8200"
  # token   = var.vault_token
  username  = var.vault_user
  password  = var.vault_pass
  namespace = "admin/network"
}

provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}


