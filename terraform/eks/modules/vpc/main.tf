
# VPC Module

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "flav-eks-vpc"
  cidr = "10.221.0.0/16"

  providers = {
    aws = aws.eu-west-2
  }

  azs = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["10.221.1.0/24", "10.221.2.0/24", "10.221.3.0/24"]
  public_subnets  = ["10.221.101.0/24", "10.221.102.0/24", "10.221.103.0/24"]

  enable_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = {
    Terraform   = "true"
    Environment = "flav"
  }
}

