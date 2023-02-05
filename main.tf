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
  address = "http://http://192.168.86.247:8200"
  token   = var.vault_token
}

provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}


