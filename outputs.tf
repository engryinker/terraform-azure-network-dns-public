output "dns_zones" {
  description = "Map (same keys as var.dns_zones) of every output from each public DNS zones created -- see upstream module docs for the full shape."
  value       = module.dns_zone
}
