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

resource "github_repository_file" "foo" {
  repository          = "learn-jenkins"
  branch              = "main"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
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

