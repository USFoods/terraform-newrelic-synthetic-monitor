# Browser Monitor Private by Id

Configuration in this directory creates a new synthetic private location along with a new synthetic browser monitor configured to run in the newly created private location.

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | >=3.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | >=3.14 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_main"></a> [main](#module\_main) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [newrelic_synthetics_private_location.setup](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/synthetics_private_location) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The id of the account where where the synthetic monitor lives | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | The run state of the monitor | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_main"></a> [main](#output\_main) | Output for the main module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
