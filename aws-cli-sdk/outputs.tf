output "iam_user_name" {
  description = "The name of the created IAM user"
  value       = aws_iam_user.devops_user.name
}

output "iam_user_arn" {
  description = "The ARN of the created IAM user"
  value       = aws_iam_user.devops_user.arn
}

output "access_key_id" {
  description = "The access key ID for the IAM user"
  value       = aws_iam_access_key.devops_user_key.id
}

output "secret_access_key" {
  description = "The secret access key for the IAM user"
  value       = aws_iam_access_key.devops_user_key.secret
  sensitive   = true
}
