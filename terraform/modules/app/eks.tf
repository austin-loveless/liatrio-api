# module "eks" {
#   source          = "terraform-aws-modules/eks/aws"
#   cluster_name    = "eks-cluster-${var.company}-${var.env}"
#   cluster_version = "1.21"
#   subnets         = module.vpc.private_subnets
#   vpc_id          = module.vpc.vpc_id

#   node_groups = {
#     eks_nodes = {
#       desired_capacity = 3
#       max_capacity     = 3
#       min_capacity     = 1

#       instance_type = "t3.medium"
#       key_name      = "eks-cluster-${var.company}-${var.env}"
#       subnets       = module.vpc.private_subnets
#     }
#   }

#   tags = {
#     Environment = var.env
#     Name        = "eks-cluster-${var.company}-${var.env}"
#   }
# }


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "eks-cluster-${var.company}-${var.env}"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
  }

eks_managed_node_groups = {
  blue = {}
  green = {
    min_size     = 2
    max_size     = 4
    desired_size = 2

    instance_types = ["t3.medium"]
    capacity_type  = "ON_DEMAND"
  }
}

  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}


