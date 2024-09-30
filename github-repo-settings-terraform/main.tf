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

# data "github_repository_webhooks" "repo" {
#   repository = "roboshop-cart"
# }

resource "github_repository" "example" {
  name        = "test1"
  description = "My awesome codebase"

  visibility = "public"

  template {
    owner                = "raghudevopsb80"
    repository           = "learn-jenkins"
    include_all_branches = true
  }
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

