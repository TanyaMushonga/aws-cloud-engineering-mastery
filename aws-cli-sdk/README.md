# Setting Up AWS CLI and SDKs for DevOps Automation

This module provides basic Terraform configurations to provision an IAM user dedicated to AWS CLI and SDK automation tasks.

## Overview

In any DevOps workflow, programmatic access is essential for tools to interact with AWS services. This simple module sets up a secure foundation by creating an IAM user with programmatic access keys, intended for use with the AWS CLI, SDKs, or CI/CD pipelines.

## Resources Created

- **IAM User**: A dedicated user for automation (`devops-automation-user`).
- **IAM Access Key**: Access credentials to be configured in your environment or CLI.
- **IAM Policy Attachment**: By default, attaches `ReadOnlyAccess` to ensure a least-privilege starting point. You can customize the policy based on your automation requirements.

## Usage

1. Initialize the Terraform module:
   ```bash
   terraform init
   ```

2. Review the plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. Retrieve your credentials:
   After a successful apply, the Access Key ID and Secret Access Key will be stored in your Terraform state. You can extract the secret key using:
   ```bash
   terraform output -raw secret_access_key
   ```
   **Note:** Handle your secret access keys securely. Do not expose them in public repositories.

## Configuration (AWS CLI)

Once you have your credentials, configure the AWS CLI on your local machine:

```bash
aws configure
```
Provide the generated Access Key ID, Secret Access Key, and your preferred default region when prompted.
