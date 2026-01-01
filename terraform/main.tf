provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.0.0"

  cluster_name    = "demo-eks"
  cluster_version = "1.29"

  subnet_ids = ["subnet-056ffe4638c24d273", "subnet-0909f92c152869571"]
  vpc_id     = "vpc-062705c97c37cc843"

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 2
      min_size     = 1

      instance_types = ["t2.micro"]
    }
  }
}
