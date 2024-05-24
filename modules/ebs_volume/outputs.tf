output "volume_ids" {
  value       = aws_ebs_volume.this[*].id
  description = "The IDs of the EBS volumes"
}
