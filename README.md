
# terraform-aws-secret-manager

[![WeSupportUkraine](https://raw.githubusercontent.com/Infrastrukturait/WeSupportUkraine/main/banner.svg)](https://github.com/Infrastrukturait/WeSupportUkraine)
## About
Terraform module for providing read and write to [AWS Secret Manager](https://aws.amazon.com/secrets-manager/).
AWS Secrets Manager helps you protect secrets needed to access your applications, services, and IT resources.
The service enables you to easily rotate, manage, and retrieve database credentials, API keys, and other secrets throughout their lifecycle.
## License

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

```text
GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
## Authors
- Rafał Masiarek | [website](https://masiarek.pl) | [email](mailto:rafal@masiarek.pl) | [github](https://github.com/rafalmasiarek)
<!-- BEGIN_TF_DOCS -->
## Documentation


### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description  of secret. | `string` | `""` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS Key ID to encrypt the secret. KMS key arn or alias can be used. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of secret to store. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Resource IAM policy which controls access to the secret. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags. | `map(string)` | `{}` | no |
| <a name="input_value"></a> [value](#input\_value) | Secret value to store. | `string` | `""` | no |
| <a name="input_values"></a> [values](#input\_values) | Secrets maps to store. | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | AWS Secret Manager secret ARN |
| <a name="output_id"></a> [id](#output\_id) | AWS Secret Manager secret ID |

### Examples

```hcl
locals {
  kms_key_id = var.kms_key_id == "" ? module.kms_key[0].key_arn : var.kms_key_id
}

module "app_prod_label" {
  source  = "cloudposse/label/null"
  version = "v0.25.0"

  namespace  = "app"
  stage      = "prod"
  name       = "prod-app"
  attributes = ["private"]
  delimiter  = "-"

  tags = {
    "BusinessUnit" = "XYZ",
  }
}

module "kms_key" {
  count   = var.kms_key_id == "" ? 1 : 0
  source  = "Infrastrukturait/kms-key/aws"
  version = "0.1.0"

  description = var.description
  tags        = module.app_prod_label.tags
}

module "secret" {
  source = "../../"

  name        = var.name
  values      = var.values
  description = var.description

  kms_key_id = local.kms_key_id

  tags = merge(
    var.tags,
    module.app_prod_label.tags
  )
}
```

<!-- END_TF_DOCS -->


<!-- references -->

[repo_link]: https://github.com/Infrastrukturait/terraform-aws-secret-manager
