variable "availability_zone" {
  description = "Availability Zone for the EBS volume"
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

variable "tags" {
  description = "Global tags to be applied to all resources"
  type        = map(string)
  default     = {}
}
