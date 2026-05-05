variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_id" {
  description = "The ID of the EC2 instance to monitor (placeholder)"
  type        = string
  default     = "i-0123456789abcdef0" # Placeholder ID
}
