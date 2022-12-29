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
  value       = var.value
  description = var.description

  kms_key_id = local.kms_key_id

  tags = merge(
    var.tags,
    module.app_prod_label.tags
  )
}
