terraform {
  backend "s3" {
    bucket         = "terraform-state-liatrio"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    profile        = "liatrio-terraform"
    dynamodb_table = "terraform-state-locking-liatrio"
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

