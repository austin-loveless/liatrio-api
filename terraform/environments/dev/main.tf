module "app" {
  source  = "../../modules/app"
  env     = var.env
  company = var.company
}

# module "shared" {
#   source = "../../modules/shared"
#   company = var.company
# }

provider "aws" {
  region = "us-east-1"
}
