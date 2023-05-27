# resource "aws_iam_role" "eks_load_balancer_controller_role" {
#   name               = "EKSLoadBalancerControllerRole"
#   assume_role_policy = file("${path.module}/policy.json")
# }
