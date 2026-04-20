# EC2 Instance Provisioning with Terraform

This project provisions an EC2 instance within a pre-existing VPC. It uses Terraform data sources to dynamically discover networking resources based on tags.

## Architecture

- **EC2 Instance**: Launches an Amazon Linux 2 instance in a public subnet.
- **Security Group**: Configured to allow inbound SSH (22) and HTTP (80) traffic.
- **Modular Approach**: Uses a reusable EC2 module for instance creation.

## Project Structure

```text
ec2-instance/
├── main.tf              # Root configuration
├── variables.tf         # Root input variables
├── outputs.tf           # Root output values
├── modules/
│   └── ec2/             # EC2 Module
│       ├── main.tf      # Core EC2 resource definitions
│       ├── variables.tf # Module input variables
│       └── outputs.tf   # Module output values
└── README.md            # Project documentation
```

## Prerequisites

1.  **VPC Infrastructure**: Ensure the `vpc-networking` module has been applied, as this project depends on the VPC and subnets it creates.
2.  **AWS Credentials**: Configured via AWS CLI.

## Deployment

1.  **Initialize**:
    ```bash
    terraform init
    ```

2.  **Plan**:
    ```bash
    terraform plan
    ```

3.  **Apply**:
    ```bash
    terraform apply
    ```

## Module Configuration

### EC2 Module Inputs

| Name | Description | Type | Default |
| :--- | :--- | :--- | :--- |
| `ami_id` | AMI ID to use | `string` | - |
| `instance_type` | EC2 instance type | `string` | `t2.micro` |
| `subnet_id` | Subnet ID | `string` | - |
| `security_group_ids` | List of SG IDs | `list(string)` | - |
| `project_name` | Project name for tagging | `string` | - |
| `instance_name` | Name tag for instance | `string` | `web-server` |

### Outputs

| Name | Description |
| :--- | :--- |
| `web_server_public_ip` | Public IP of the instance |
| `web_server_instance_id` | ID of the instance |
