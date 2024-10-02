variable "repos" {
  default = {
    "roboshop-cart" = {}
    "roboshop-catalogue" = {}
    "roboshop-user" = {}
    "roboshop-shipping" = {}
    "roboshop-payment" = {}
    "roboshop-frontend" = {}
  }
}

variable "env" {
  default = {
    "DEV" = {}
    "QA" = {}
    "UAT" = {}
    "PROD" = {}
  }
}

locals {
  repos_with_envs = {for i,j in var.repos : i => { for x,y in var.env : "${i}_${x}" => {"env" = x, "app" = i} }}
  repo_with_env_list = flatten([for a,b in local.repos_with_envs: values(b)])
}
