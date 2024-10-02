data "github_user" "user" {
  username = "r-devops"
}

resource "github_repository_environment" "env" {
  count               = length(var.repos)
  environment         = element(var.repos["env"], count.index)
  repository          = element(var.repos["app"], count.index)
  prevent_self_review = false
  reviewers {
    users = [data.github_user.user.id]
  }
}

provider "github" {
  owner = "raghudevopsb80"
}
