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
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | >=3.14 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | >=3.14 |
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
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The account in which the Synthetics monitor was created |
| <a name="output_bypass_head_request"></a> [bypass\_head\_request](#output\_bypass\_head\_request) | Monitor should skip default HEAD request and instead use GET verb in check |
| <a name="output_condition_critical_operator"></a> [condition\_critical\_operator](#output\_condition\_critical\_operator) | The operator used when evaluating the critical threshold |
| <a name="output_condition_critical_threshold"></a> [condition\_critical\_threshold](#output\_condition\_critical\_threshold) | The value which will trigger a critical incident |
| <a name="output_condition_critical_threshold_duration"></a> [condition\_critical\_threshold\_duration](#output\_condition\_critical\_threshold\_duration) | The duration, in seconds, that the threshold must violate in order to create an incident |
| <a name="output_condition_critical_threshold_occurrences"></a> [condition\_critical\_threshold\_occurrences](#output\_condition\_critical\_threshold\_occurrences) | The criteria for how many data points must be in violation for the specified threshold duration |
| <a name="output_condition_description"></a> [condition\_description](#output\_condition\_description) | The description of the NRQL alert condition |
| <a name="output_condition_enabled"></a> [condition\_enabled](#output\_condition\_enabled) | Whether the alert condition is enabled |
| <a name="output_condition_name"></a> [condition\_name](#output\_condition\_name) | The title of the condition |
| <a name="output_condition_policy_id"></a> [condition\_policy\_id](#output\_condition\_policy\_id) | The ID of the policy where this condition is used |
| <a name="output_condition_runbook_url"></a> [condition\_runbook\_url](#output\_condition\_runbook\_url) | Runbook URL to display in notifications |
| <a name="output_condition_tags"></a> [condition\_tags](#output\_condition\_tags) | The tags associated with the alert condition |
| <a name="output_enable_screenshot_on_failure_and_script"></a> [enable\_screenshot\_on\_failure\_and\_script](#output\_enable\_screenshot\_on\_failure\_and\_script) | Capture a screenshot during job execution |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | The run state of the monitor |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Synthetics script monitor |
| <a name="output_name"></a> [name](#output\_name) | The name for the monitor |
| <a name="output_period"></a> [period](#output\_period) | The interval at which this monitor is run |
| <a name="output_private_locations"></a> [private\_locations](#output\_private\_locations) | The private locations the monitor is running from |
| <a name="output_public_locations"></a> [public\_locations](#output\_public\_locations) | The public locations the monitor is running from |
| <a name="output_runtime_type"></a> [runtime\_type](#output\_runtime\_type) | The runtime that the monitor uses to run jobs |
| <a name="output_runtime_version"></a> [runtime\_version](#output\_runtime\_version) | The specific version of the runtime type selected |
| <a name="output_script_language"></a> [script\_language](#output\_script\_language) | The programing language that executes the script |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags associated with the synthetics script monitor |
| <a name="output_treat_redirect_as_failure"></a> [treat\_redirect\_as\_failure](#output\_treat\_redirect\_as\_failure) | Categorize redirects during a monitor job as a failure |
| <a name="output_type"></a> [type](#output\_type) | The plaintext representing the monitor script |
| <a name="output_uri"></a> [uri](#output\_uri) | The URI the monitor runs against |
| <a name="output_validation_string"></a> [validation\_string](#output\_validation\_string) | The string to validate the response |
| <a name="output_verify_ssl"></a> [verify\_ssl](#output\_verify\_ssl) | Monitor should verify SSL certificates |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
