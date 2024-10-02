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

data "github_user" "user" {
  username = "r-devops"
}

resource "github_repository_environment" "env" {
  count               = length(local.repo_with_env_list)
  environment         = local.repo_with_env_list[count.index]["env"]
  repository          = local.repo_with_env_list[count.index]["app"]
  prevent_self_review = false
  reviewers {
    users = [data.github_user.user.id]
  }
}

