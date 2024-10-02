resource "github_repository_webhook" "main" {
  for_each   = var.repos
  repository = each.key

  configuration {
    url          = "http://jenkins.rdevopsb80.online:8080/multibranch-webhook-trigger/invoke?token=${each.key}"
    content_type = "form"
  }
  active = true
  events = ["push"]
}

module "ENV" {
  source     = "./ADD-ENV-GITHUB"
  repos      = local.repo_with_env_list
}

