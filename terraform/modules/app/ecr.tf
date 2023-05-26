resource "aws_ecr_repository" "repo" {
  name                 = "ecr-repo-${var.company}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}