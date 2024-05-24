variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Global tags to be applied to all resources"
  type        = map(string)
  default = {
    Environment  = "production"
    Project      = "my-project"
    Owner        = "DevOps Team"
    Significance = "high"
    Impact       = "high"
  }
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "Custom AMI ID, defaults to Amazon managed AMI if not provided"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = ""
}

variable "ebs_volumes" {
  description = "List of EBS volumes to attach"
  type = list(object({
    size        = number
    type        = string
    mount_point = string
  }))
  default = []
}

variable "enable_monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = true
}


variable "security_groups" {
  description = "List of security group definitions"
  type = list(object({
    name        = string
    description = string
    ingress = list(object({
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = optional(list(string), [])
      ipv6_cidr_blocks = optional(list(string), [])
    }))
    egress = list(object({
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = optional(list(string), [])
      ipv6_cidr_blocks = optional(list(string), [])
    }))
    tags = optional(map(string), {})
  }))
}
