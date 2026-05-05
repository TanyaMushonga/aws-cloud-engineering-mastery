# AWS Cloud Engineering Mastery

Welcome to the **AWS Cloud Engineering Mastery** series! This repository is a collection of production-ready Terraform scripts and cloud infrastructure patterns designed to help you master AWS cloud engineering.

## 🚀 Series Roadmap

This repository is organized into modules, each focusing on a specific aspect of AWS infrastructure.

### 1. [VPC Networking](./vpc-networking)
The foundation of any cloud infrastructure. Includes:
- Multi-AZ VPC setup.
- Public and Private subnets.
- Internet Gateway and Route Tables.

### 2. [EC2 Instances](./ec2-instance)
Launch and manage compute resources. Includes:
- Modular EC2 instance creation.
- Security Groups for web and SSH access.
- Dynamic resource discovery using Terraform data sources.

### 3. [Securing Amazon S3](./s3-security)
Manage and secure S3 storage. Includes:
- S3 Bucket Policies and ACLs.
- Public Access Blocks.
- Modular S3 bucket configuration.

### 4. [AWS CLI and SDK Setup](./aws-cli-sdk)
Setting Up AWS CLI and SDKs for DevOps Automation. Includes:
- Dedicated IAM user for automation.
- Programmatic access keys generation.
- Read-only policy attachment for foundational security.

## 🛠 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate permissions.
- Basic understanding of AWS core services (VPC, EC2, IAM).

## 📂 Repository Structure

```text
.
├── vpc-networking/    # VPC and networking infrastructure
├── ec2-instance/      # Compute and security group configuration
├── s3-security/       # S3 storage and security configurations
├── aws-cli-sdk/       # IAM users and credentials for CLI/SDK automation
├── CONTRIBUTING.md    # Contribution guidelines
└── LICENSE            # Project license
```

## 🚦 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/TanyaMushonga/aws-cloud-engineering-mastery
   ```
2. Navigate to a specific module:
   ```bash
   cd vpc-networking
   ```
3. Initialize and apply:
   ```bash
   terraform init
   terraform apply
   ```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
