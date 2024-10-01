data "github_user" "user" {
  username = "r-devops"
}

resource "github_repository_environment" "env" {
  count               = length(var.ENV)
  environment         = element(var.ENV, count.index)
  repository          = var.repository
  prevent_self_review = false
  reviewers {
    users = [data.github_user.user.id]
  }
}

