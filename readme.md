Example output from setting AWS default_tag values via workspace name:

```
Terraform will perform the following actions:

  # aws_vpc.this will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags_all                             = {
          + "fqdn"        = "https://app.terraform.io"
          + "id"          = "203982"
          + "last_run_id" = "run-Zx8cAYoDPaEZN5Xp"
          + "providedby"  = "tfe1"
          + "workspace"   = "aws_default_tagging"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```