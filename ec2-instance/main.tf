provider "aws" {
  region = var.aws_region
}

# Data source to find the VPC created in vpc-networking
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${var.project_name}-vpc"]
  }
}

# Data source to find the public subnet
data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["${var.project_name}-public-subnet-1"]
  }
}

# Data source for Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Security Group for SSH and HTTP
resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-web-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # In production, restrict this to your IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-web-sg"
  }
}

# Module Call
module "ec2_instance" {
  source = "./modules/ec2"

  project_name       = var.project_name
  ami_id             = data.aws_ami.amazon_linux_2.id
  instance_type      = var.instance_type
  subnet_id          = data.aws_subnet.public.id
  security_group_ids = [aws_security_group.web_sg.id]
  instance_name      = "web-server"
}
