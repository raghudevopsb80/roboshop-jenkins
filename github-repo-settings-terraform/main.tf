resource "github_repository_webhook" "main" {
  count      = length(var.repos)
  repository = element(var.repos, count.index)

  configuration {
    url          = "http://jenkins.rdevopsb80.online:8080/multibranch-webhook-trigger/invoke?token=${element(var.repos, count.index)}"
    content_type = "form"
  }
  active = true
  events = ["push"]
}

module "ENV" {
  source     = "./ADD-ENV-GITHUB"
  ENV        = ["DEV", "QA", "UAT", "PROD"]
  repos      = var.repos
}

