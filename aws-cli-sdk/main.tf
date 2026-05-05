terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Create an IAM user for DevOps automation via CLI/SDK
resource "aws_iam_user" "devops_user" {
  name = var.iam_user_name
  path = "/"

  tags = {
    Environment = "DevOps"
    Purpose     = "CLI and SDK Automation"
  }
}

# Create an IAM access key for the user
resource "aws_iam_access_key" "devops_user_key" {
  user = aws_iam_user.devops_user.name
}

# Attach a read-only policy for basic access (can be expanded later)
resource "aws_iam_user_policy_attachment" "devops_user_read_only" {
  user       = aws_iam_user.devops_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
