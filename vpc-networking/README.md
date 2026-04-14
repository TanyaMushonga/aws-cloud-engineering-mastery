# VPC Networking with Terraform

This project provides a modular approach to creating a Virtual Private Cloud (VPC) on AWS. It is designed to be reusable, scalable, and secure.

## Architecture

The VPC is configured with the following resources:

- **VPC**: CIDR block `10.0.0.0/16`.
- **Subnets**:
  - **Public Subnets**: Distributed across multiple Availability Zones with auto-assign public IP enabled. These are intended for resources like load balancers and NAT gateways.
  - **Private Subnets**: Isolated from the public internet, suitable for databases and application servers.
- **Internet Gateway**: Attached to the VPC to enable internet access for public subnets.
- **Route Tables**:
  - **Public Route Table**: Contains a default route (`0.0.0.0/0`) to the Internet Gateway.
  - **Private Route Table**: Contains no public routes by default, ensuring network isolation.

## Project Structure

```text
vpc-networking/
├── main.tf              # Root configuration (entry point)
├── variables.tf         # Root input variables
├── outputs.tf           # Root output values
├── modules/
│   └── vpc/             # VPC Module
│       ├── main.tf      # Core VPC resource definitions
│       ├── variables.tf # Module input variables
│       └── outputs.tf   # Module output values
└── README.md            # Project documentation
```

## Getting Started

### Prerequisites

1.  **Terraform**: Install Terraform (v1.0+ recommended).
2.  **AWS CLI**: Configure your AWS credentials using `aws configure`.
3.  **Permissions**: Ensure your IAM user has permissions to create VPCs, subnets, and related networking resources.

### Deployment

1.  **Initialize Terraform**:
    ```bash
    terraform init
    ```

2.  **Review Execution Plan**:
    ```bash
    terraform plan
    ```

3.  **Apply Configuration**:
    ```bash
    terraform apply
    ```

## Module Configuration

### Inputs

| Name | Description | Type | Default |
| :--- | :--- | :--- | :--- |
| `vpc_cidr` | CIDR block for the VPC | `string` | `10.0.0.0/16` |
| `project_name` | Name used for tagging resources | `string` | - |
| `public_subnet_cidrs` | List of public subnet CIDRs | `list(string)` | `["10.0.1.0/24", "10.0.2.0/24"]` |
| `private_subnet_cidrs` | List of private subnet CIDRs | `list(string)` | `["10.0.11.0/24", "10.0.12.0/24"]` |
| `availability_zones` | List of AZs to use | `list(string)` | `["us-east-1a", "us-east-1b"]` |

### Outputs

| Name | Description |
| :--- | :--- |
| `vpc_id` | The ID of the created VPC |
| `public_subnet_ids` | IDs of the public subnets |
| `private_subnet_ids` | IDs of the private subnets |
| `internet_gateway_id` | ID of the Internet Gateway |

## Best Practices

- **Security Groups**: After creating this VPC, use Security Groups to further restrict traffic between subnets.
- **NAT Gateway**: For private subnets to access the internet (e.g., for updates), consider adding a NAT Gateway to your configuration.
- **State Management**: Use a remote backend (like S3) for production environments to store your Terraform state safely.
