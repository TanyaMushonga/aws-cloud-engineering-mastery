output "web_server_public_ip" {
  description = "Public IP of the web server"
  value       = module.ec2_instance.public_ips[0]
}

output "web_server_instance_id" {
  description = "Instance ID of the web server"
  value       = module.ec2_instance.instance_ids[0]
}
