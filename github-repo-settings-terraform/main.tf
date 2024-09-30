# resource "github_repository_webhook" "main" {
#     repository = "roboshop-cart"
#
#   configuration {
#     url          = "http://jenkins.rdevopsb80.online:8080/multibranch-webhook-trigger/invoke?token=roboshop-cart"
#     content_type = "form"
#   }
#   active = true
#   events = ["push"]
# }

data "github_repository_webhooks" "repo" {
  repository = "roboshop-cart"
}

output "test" {
  value = data.github_repository_webhooks.repo
}


provider "github" {
  owner = "raghudevopsb80"
}


terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

