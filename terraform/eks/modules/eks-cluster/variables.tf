
# General Variables from root module


variable "profile" {
  type = string
}

variable "main-region" {
  type = string
}


# Variables from other Modules


variable "vpc_id" {
  type        = string
}

variable "private_subnets" {
  type        = list(any)
}

variable "auth_users" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
}
