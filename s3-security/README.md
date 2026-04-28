# Securing Amazon S3: Policy, ACLs, and Public Access Block

Welcome to the S3 Security module of the AWS Cloud Engineering Mastery series. In this section, we will explore the critical aspects of securing your Amazon S3 buckets and objects.

## Topics Covered

1. **IAM Policies vs. Bucket Policies**: Understanding when to use which and how they interact.
2. **Access Control Lists (ACLs)**: Legacy access management and when it's still applicable.
3. **Public Access Block**: Ensuring your buckets are protected against accidental public exposure.
4. **Encryption**: Enabling server-side encryption (SSE-S3, SSE-KMS) to protect data at rest.
5. **VPC Endpoints for S3**: Securing access from within your Virtual Private Cloud.

## Structure

We will use Terraform to provision S3 buckets with various security configurations to demonstrate best practices.

* `main.tf` - Core infrastructure setup.
* `variables.tf` - Input variables.
* `outputs.tf` - Output values.
* `modules/` - Reusable Terraform modules for S3 bucket creation and security policies.

Let's dive into securing your object storage!
