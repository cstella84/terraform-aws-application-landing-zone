# Create a project in Terraform Cloud
resource "tfe_project" "app" {
  name         = "Project-${var.app_name}"
  organization = var.tfc_org
}

# Create a workspace in the project
resource "tfe_workspace" "app1-ws-dev" {
  name         = "${var.app_name}-ws-dev"
  organization = var.tfc_org
  project_id   = tfe_project.app.id
  depends_on = [gitlab_project.app-repo]
  vcs_repo {
    identifier = "instruqt-learners/${var.app_name}-repo"
    oauth_token_id = tfe_oauth_client.test-oauth-client.oauth_token_id
    branch = "main"
  }
}

# Create a team in Terraform Cloud
resource "tfe_team" "app-admins" {
  name         = "${var.app_name}-admins"
  organization = var.tfc_org
}

# Create a Terraform variable in the workspace
resource "tfe_variable" "aws_vpc_id" {
  key = "aws_vpc_id"
  value = var.aws_vpc_id
  category = "terraform"
  workspace_id = tfe_workspace.app1-ws-dev.id
}

# Create another Terraform variable in the workspace
resource "tfe_variable" "aws_public_subnet_id" {
  key = "aws_public_subnet_id"
  value = var.aws_public_subnet_id
  category = "terraform"
  workspace_id = tfe_workspace.app1-ws-dev.id
}

# Create another Terraform variable in the workspace
resource "tfe_variable" "aws_private_subnet_id" {
  key = "aws_private_subnet_id"
  value = var.aws_private_subnet_id
  category = "terraform"
  workspace_id = tfe_workspace.app1-ws-dev.id
}

# Create another Terraform variable in the workspace
resource "tfe_variable" "aws_s3_bucket_arn" {
  key = "aws_s3_bucket_arn"
  value = var.aws_s3_bucket_arn
  category = "terraform"
  workspace_id = tfe_workspace.app1-ws-dev.id
}

# Assign team access to the project
resource "tfe_team_project_access" "app-admins" {
  access       = "write"
  team_id      = tfe_team.app-admins.id
  project_id   = tfe_project.app.id
}

# Setup VCS OAuth Connection
resource "tfe_oauth_client" "test-oauth-client" {
  organization     = var.tfc_org
  api_url          = "${var.gitlab_base_url}/api/v4"
  http_url         = var.gitlab_base_url
  oauth_token      = var.gitlab_token
  service_provider = "gitlab_community_edition"
}