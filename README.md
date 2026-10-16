# terraform-azure-network-dns-public

Org-standard Terraform wrapper for: **public DNS zones**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "network-dns-public" {
  source = "git::https://github.com/engryinker/terraform-azure-network-dns-public.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  dns_zones = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `dns_zones` (public DNS zones)

Wraps [Azure/avm-res-network-dnszone/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-dnszone/azurerm/0.2.1) v0.2.1.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `cname_records` | `any` | no |  |
| `srv_records` | `any` | no |  |
| `a_records` | `any` | no |  |
| `aaaa_records` | `any` | no |  |
| `caa_records` | `any` | no |  |
| `mx_records` | `any` | no |  |
| `ns_records` | `any` | no |  |
| `ptr_records` | `any` | no |  |
| `txt_records` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `dns_zones` -- map (same keys as the input) of every output from each created public DNS zones.
