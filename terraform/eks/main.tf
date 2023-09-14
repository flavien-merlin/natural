# VPC Module


module "vpc" {
  source = "./modules/vpc"

  main-region = var.main-region
  profile     = var.profile
}

# EKS Cluster Module

module "eks" {
  source = "./modules/eks-cluster"

  main-region = var.main-region
  profile     = var.profile
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  auth_users = [
    {
      username = "candidate02"
      groups   = ["system:masters"]
      userarn  = "arn:aws:iam::445521015129:user/candidate02"
    }
  ]
}

# Ingress

module "ingress" {
  source = "./modules/ingress"

  main-region  = var.main-region
  env_name     = var.env_name
  cluster_name = var.cluster_name

  vpc_id            = module.vpc.vpc_id
  oidc_provider_arn = module.eks.oidc_provider_arn
}

# API Chuck Noris
module "app" {
  source = "./modules/app"

  main-region  = var.main-region
  env_name     = var.env_name
  cluster_name = var.cluster_name

  vpc_id            = module.vpc.vpc_id
  oidc_provider_arn = module.eks.oidc_provider_arn
}

