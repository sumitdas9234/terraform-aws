variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "security_groups" {
  description = "A list of security group definitions"
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
