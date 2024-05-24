variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
  default     = []
}

variable "iam_role_name" {
  description = "IAM Role Name for EC2"
  type        = string
  default     = ""
}

variable "ebs_volumes" {
  description = "List of EBS volumes"
  type = list(object({
    size        = number
    type        = string
    mount_point = string
  }))
  default = []
}

variable "enable_monitoring" {
  description = "Enable EC2 monitoring"
  type        = bool
  default     = true
}
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Global tags to be applied to all resources"
  type        = map(string)
  default     = {}
}
