terraform {
  backend "s3" {
    bucket         = "terraform-state-liatrio-prod"
    key            = "global/s3/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking-liatrio-prod"
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

