module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-learning-vpc"
  cidr = "10.1.0.0/16"

  azs                     = ["us-west-2a", "us-west-2b"]
  public_subnets          = ["10.1.1.0/24", "10.1.2.0/24"]
  map_public_ip_on_launch = true

  public_subnet_tags = {
    "kubernetes.io/cluster/eks-learning" = "shared"
    "kubernetes.io/role/elb"             = "1"
  }
}