
output "iam_role_arn" {
  value       = aws_iam_role.ec2_ssm_role.arn
  description = "The ARN of the IAM role"
}

output "iam_role_name" {
  value       = aws_iam_role.ec2_ssm_role.name
  description = "The name of the IAM role"
}
