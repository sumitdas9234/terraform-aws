output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = module.ec2_instance.instance_ids
}

output "private_ips" {
  description = "Private IPs of the created EC2 instances"
  value       = module.ec2_instance.private_ips
}
