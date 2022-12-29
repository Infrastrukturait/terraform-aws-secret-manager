output "arn" {
  value       = aws_secretsmanager_secret.this.arn
  description = "AWS Secret Manager secret ARN"

}

output "id" {
  value       = aws_secretsmanager_secret.this.id
  description = "AWS Secret Manager secret ID"
}
