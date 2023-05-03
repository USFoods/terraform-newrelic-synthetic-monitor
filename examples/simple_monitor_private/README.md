# Simple Monitor Private

Configuration in this directory creates a new synthetic private location along with a new synthetic simple monitor configured to run in the newly created private location.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~>3.13.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | ~>3.13.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.9.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_main"></a> [main](#module\_main) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [newrelic_synthetics_private_location.main](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_private_location) | resource |
| [time_sleep.wait_10_seconds](https://registry.terraform.io/providers/hashicorp/time/0.9.1/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The New Relic account ID of the account you wish to create the condition | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether to enable the synthetics script monitor | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_bypass_head_request"></a> [module\_bypass\_head\_request](#output\_module\_bypass\_head\_request) | Monitor should skip default HEAD request and instead use GET verb in check |
| <a name="output_module_id"></a> [module\_id](#output\_module\_id) | The ID of the Synthetics script monitor |
| <a name="output_module_name"></a> [module\_name](#output\_module\_name) | The name for the monitor |
| <a name="output_module_period"></a> [module\_period](#output\_module\_period) | The interval at which this monitor is run |
| <a name="output_module_private_locations"></a> [module\_private\_locations](#output\_module\_private\_locations) | The private locations the monitor is running from |
| <a name="output_module_public_locations"></a> [module\_public\_locations](#output\_module\_public\_locations) | The public locations the monitor is running from |
| <a name="output_module_runtime_type"></a> [module\_runtime\_type](#output\_module\_runtime\_type) | The runtime that the monitor uses to run jobs |
| <a name="output_module_runtime_version"></a> [module\_runtime\_version](#output\_module\_runtime\_version) | The specific version of the runtime type selected |
| <a name="output_module_script_language"></a> [module\_script\_language](#output\_module\_script\_language) | The programing language that executes the script |
| <a name="output_module_status"></a> [module\_status](#output\_module\_status) | The run state of the monitor |
| <a name="output_module_tags"></a> [module\_tags](#output\_module\_tags) | The tags associated with the synthetics script monitor |
| <a name="output_module_treat_redirect_as_failure"></a> [module\_treat\_redirect\_as\_failure](#output\_module\_treat\_redirect\_as\_failure) | Categorize redirects during a monitor job as a failure |
| <a name="output_module_type"></a> [module\_type](#output\_module\_type) | The plaintext representing the monitor script |
| <a name="output_module_validation_string"></a> [module\_validation\_string](#output\_module\_validation\_string) | The string to validate the monitor against |
| <a name="output_module_verify_ssl"></a> [module\_verify\_ssl](#output\_module\_verify\_ssl) | Monitor should verify SSL certificates |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
