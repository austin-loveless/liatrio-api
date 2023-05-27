terraform {
  backend "s3" {
    bucket         = "terraform-state-liatrio-develop"
    key            = "global/s3/develop/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking-liatrio-develop"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = "~> 1.4.0"
}