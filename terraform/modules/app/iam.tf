resource "aws_iam_role" "eks_load_balancer_controller_role" {
  name               = "EKSLoadBalancerControllerRole-${var.env}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
           "sts:AssumeRoleWithWebIdentity",
        ]
        Effect   = "Allow"
        Principal = {
            "Federated": "arn:aws:iam::807230335956:${module.eks.oidc_provider}"
        }
        Condition = {
            StringEquals = {
                "${module.eks.oidc_provider}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller",
                 "${module.eks.oidc_provider}:aud":  "sts.amazonaws.com"
            }
        }
      },
    ]
  })
}



resource "aws_iam_policy" "eks_load_balancer_controller_policy" {
  name        = "EKSLoadBalancerControllerPolicy-${var.env}"
  policy       = file("${path.module}/policy.json")
}

resource "aws_iam_role_policy_attachment" "eks_load_balancer_controller_policy-attachment" {
  role       = aws_iam_role.eks_load_balancer_controller_role.name
  policy_arn = aws_iam_policy.eks_load_balancer_controller_policy.arn
}