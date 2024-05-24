terraform {
  required_version = ">=1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.51.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-efdtd34"
    key            = "ec2-instance/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state"
    encrypt        = true
  }
}
