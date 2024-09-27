resource "github_repository_webhook" "main" {
  repository = "roboshop-cart"

  configuration {
    url          = "http://jenkins.rdevopsb80.online:8080/multibranch-webhook-trigger/invoke?token=roboshop-cart"
    content_type = "form"
  }
  active = true
  events = ["push"]
}

provider "github" {
  owner = "raghudevopsb80"
  base_url = "https://github.com"
}

