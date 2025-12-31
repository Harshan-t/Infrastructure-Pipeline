provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.0.0"

  cluster_name    = "demo-eks"
  cluster_version = "1.29"

  subnet_ids = ["subnet-xxxx", "subnet-yyyy"]
  vpc_id     = "vpc-xxxx"

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.medium"]
    }
  }
}
