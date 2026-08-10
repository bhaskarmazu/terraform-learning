module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "eks-learning"
  kubernetes_version = "1.35"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  endpoint_public_access = true

  addons = {
    vpc-cni = {
      most_recent    = true
      before_compute = true   # install CNI before the node group comes up
    }
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 1
      desired_size   = 1
      subnet_ids     = module.vpc.public_subnets
    }
  }

  enable_cluster_creator_admin_permissions = true
}