terraform {
  required_version = ">= 1.7.0"
}

module "network-dns-public" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  dns_zones = {} # see README Inputs table / upstream module docs for the per-entry schema
}
