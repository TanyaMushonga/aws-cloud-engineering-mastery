variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "iam_user_name" {
  description = "Name of the IAM user for CLI/SDK automation"
  type        = string
  default     = "devops-automation-user"
}
