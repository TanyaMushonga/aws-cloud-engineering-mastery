resource "aws_instance" "this" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.instance_count > 1 ? "${var.project_name}-${var.instance_name}-${count.index + 1}" : "${var.project_name}-${var.instance_name}"
    Project = var.project_name
  }
}
