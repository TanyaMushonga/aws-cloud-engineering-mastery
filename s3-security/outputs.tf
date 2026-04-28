output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.secure_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.secure_bucket.arn
}

output "bucket_domain_name" {
  description = "The bucket regional domain name"
  value       = aws_s3_bucket.secure_bucket.bucket_regional_domain_name
}
