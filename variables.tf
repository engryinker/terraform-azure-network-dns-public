variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "dns_zones" {
  description = "Map of public DNS zones to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-network-dnszone/azurerm v0.2.1 (https://registry.terraform.io/modules/Azure/avm-res-network-dnszone/azurerm/0.2.1) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name             = string
    tags             = optional(map(string))
    enable_telemetry = optional(bool)
    cname_records    = optional(any, null)
    srv_records      = optional(any, null)
    a_records        = optional(any, null)
    aaaa_records     = optional(any, null)
    caa_records      = optional(any, null)
    mx_records       = optional(any, null)
    ns_records       = optional(any, null)
    ptr_records      = optional(any, null)
    txt_records      = optional(any, null)
  }))
  default = {}
}
