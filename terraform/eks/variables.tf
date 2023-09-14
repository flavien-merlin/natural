

# Default Variables


variable "profile" {
  type    = string
  default = "default"
}

variable "main-region" {
  type    = string
  default = "eu-west-2"
}



# EKS Cluster Variables


variable "cluster_name" {
  type    = string
  default = "flav-eks"
}

# variable "rolearn" {
#   description = "Add admin role to the aws-auth configmap"
# }


# ALB Controller Variables


variable "env_name" {
  type    = string
  default = "flav"
}

