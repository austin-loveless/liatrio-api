module "app" {
  source = "../../modules/app"
  env = var.env
  company = var.company
}

provider "aws" {
  profile = "liatrio-terraform"
  region  = "us-east-1"
}
