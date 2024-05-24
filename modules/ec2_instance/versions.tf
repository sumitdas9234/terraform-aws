terraform {
  required_version = ">=1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.51.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.2"
    }
  }
}
