terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}


provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
