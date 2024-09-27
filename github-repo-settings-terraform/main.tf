# resource "github_organization_webhook" "main" {
#    name = "raghudevopsb80/roboshop-cart"
#
#   configuration {
#     url          = "http://jenkins.rdevopsb80.online:8080/multibranch-webhook-trigger/invoke?token=roboshop-cart"
#     content_type = "form"
#   }
#   active = true
#   events = ["push"]
# }
#
#
# # provider "github" {
# #   organization = "raghudevopsb80"
# # }


resource "github_organization_webhook" "foo" {
  name = "web"

  configuration {
    url          = "https://google.de/"
    content_type = "form"
    insecure_ssl = false
  }

  active = false

  events = ["issues"]
}