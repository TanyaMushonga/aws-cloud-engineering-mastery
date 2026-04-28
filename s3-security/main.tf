terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Generate a random suffix to ensure globally unique bucket names
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# The core S3 Bucket resource
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "${var.project_name}-${var.bucket_name_prefix}-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "${var.project_name}-secure-bucket"
    Environment = "Dev"
  }
}

# 1. Bucket Ownership Controls
# Ensures that objects uploaded to the bucket are owned by the bucket owner
resource "aws_s3_bucket_ownership_controls" "secure_bucket_ownership" {
  bucket = aws_s3_bucket.secure_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# 2. Access Control List (ACL)
# Sets the legacy ACL to 'private' (requires ownership controls to be applied first)
resource "aws_s3_bucket_acl" "secure_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.secure_bucket_ownership]

  bucket = aws_s3_bucket.secure_bucket.id
  acl    = "private"
}

# 3. Public Access Block
# Blocks all forms of public access at the bucket level
resource "aws_s3_bucket_public_access_block" "secure_bucket_pab" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 4. Bucket Policy
# Example of a secure bucket policy: Enforcing encryption in transit (HTTPS/TLS)
resource "aws_s3_bucket_policy" "secure_bucket_policy" {
  bucket = aws_s3_bucket.secure_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "EnforceTLS"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.secure_bucket.arn,
          "${aws_s3_bucket.secure_bucket.arn}/*",
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

# 5. Server-Side Encryption Configuration
# Ensures all objects are encrypted at rest using Amazon S3-managed keys (SSE-S3)
resource "aws_s3_bucket_server_side_encryption_configuration" "secure_bucket_encryption" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
