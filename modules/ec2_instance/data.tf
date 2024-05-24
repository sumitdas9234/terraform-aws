data "aws_ami" "custom" {
  count       = var.ami_id != "" ? 1 : 0
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "image-id"
    values = [var.ami_id]
  }
}

data "aws_ec2_instance_type_offerings" "available_types" {
  filter {
    name   = "location"
    values = [var.region]
  }
  location_type = "region"
}

data "aws_ami" "latest" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

locals {
  selected_instance_type = contains(data.aws_ec2_instance_type_offerings.available_types.instance_types, var.instance_type) ? var.instance_type : data.aws_ec2_instance_type_offerings.available_types.instance_types[0]
}
