resource "github_organization_webhook" "main" {
#    name = "raghudevopsb80/roboshop-cart"

  configuration {
    url          = "http://jenkins.rdevopsb80.online:8080/multibranch-webhook-trigger/invoke?token=roboshop-cart"
    content_type = "form"
  }
  active = true
  events = ["push"]
}




terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

