## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_btp"></a> [btp](#requirement\_btp) | >= 1.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_btp"></a> [btp](#provider\_btp) | >= 1.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subaccount_namings"></a> [subaccount\_namings](#module\_subaccount\_namings) | ../sap-btp-naming-conventions-subaccount | n/a |

## Resources

| Name | Type |
|------|------|
| [btp_subaccount.self](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | Business unit of the project e.g., HR, IT or Sales | `string` | n/a | yes |
| <a name="input_company_name"></a> [company\_name](#input\_company\_name) | Company name to be used for subaccount subdomains. The parameter is optional<br/>Default value: `null`. | `string` | `null` | no |
| <a name="input_costcenter"></a> [costcenter](#input\_costcenter) | Cost center to be used for subaccounts | `string` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | ID of the parent directory | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage of the environment to be setup up.<br/>Possible values: `Dev`, `Test`, `Prod`, `Shared`. | `string` | n/a | yes |
| <a name="input_subaccount_contacts"></a> [subaccount\_contacts](#input\_subaccount\_contacts) | Contact persons to be used for subaccount, added as label | `list(string)` | n/a | yes |
| <a name="input_subaccount_region"></a> [subaccount\_region](#input\_subaccount\_region) | Region of the subaccount. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_business_unit"></a> [business\_unit](#output\_business\_unit) | Business unit of the project e.g., HR, IT or Sales |
| <a name="output_costcenter"></a> [costcenter](#output\_costcenter) | Cost center to be used for subaccounts |
| <a name="output_stage"></a> [stage](#output\_stage) | The geographical region for a directory. The parameter is optional |
| <a name="output_subaccount_id"></a> [subaccount\_id](#output\_subaccount\_id) | Technical ID of the directory |
| <a name="output_subaccount_name"></a> [subaccount\_name](#output\_subaccount\_name) | The name of the directory |
