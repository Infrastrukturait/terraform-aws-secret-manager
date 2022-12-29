output "arn" {
  value       = module.secret.arn
  description = "AWS Secret Manager secret ARN"
}

output "id" {
  value       = module.secret.id
  description = "AWS Secret Manager secret ID"
}
