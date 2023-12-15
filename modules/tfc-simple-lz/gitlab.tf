# Reference existing group in Gitlab
data "gitlab_group" "instruqt_group" {
  full_path = "instruqt-learners"
}

# Creates a new project under the Instruqt Group
resource "gitlab_project" "app-repo" {
  name = "${var.app_name}-repo"
  namespace_id = data.gitlab_group.instruqt_group.id
  visibility_level = "public"
  default_branch = "main"
  initialize_with_readme = true
}