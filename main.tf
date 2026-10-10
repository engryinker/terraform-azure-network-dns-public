data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "dns_zone" {
  source   = "Azure/avm-res-network-dnszone/azurerm"
  version  = "0.2.1"
  for_each = var.dns_zones

  name                = each.value.name
  resource_group_name = var.resource_group_name
  tags                = coalesce(each.value.tags, var.tags)
  enable_telemetry    = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  cname_records       = each.value.cname_records
  srv_records         = each.value.srv_records
  a_records           = each.value.a_records
  aaaa_records        = each.value.aaaa_records
  caa_records         = each.value.caa_records
  mx_records          = each.value.mx_records
  ns_records          = each.value.ns_records
  ptr_records         = each.value.ptr_records
  txt_records         = each.value.txt_records
}
