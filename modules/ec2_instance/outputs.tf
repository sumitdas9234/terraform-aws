output "instance_ids" {
  value       = aws_instance.this[*].id
  description = "The IDs of the EC2 instances"
}

output "private_ips" {
  value       = aws_instance.this[*].private_ip
  description = "The private IP addresses of the EC2 instances"
}
