locals {
  secret_id = aws_secretsmanager_secret.this.id
}

resource "aws_secretsmanager_secret" "this" {
  name        = var.name
  description = var.description
  policy      = var.policy
  kms_key_id  = var.kms_key_id
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = local.secret_id
  secret_string = var.value
}
