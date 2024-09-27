resource "github_organization_webhook" "main" {
  name = "roboshop-cart"

  configuration {
    url          = "http://jenkins.rdevopsb80.online:8080/multibranch-webhook-trigger/invoke?token=roboshop-cart"
    content_type = "form"
  }
  active = true
  events = ["push"]
}


