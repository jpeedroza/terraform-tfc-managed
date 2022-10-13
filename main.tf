resource "tfe_organization" "this" {
  count = length(local.config.organizations)
  name  = local.config.organizations[count.index].name
  email = local.config.organizations[count.index].email

  lifecycle {
    prevent_destroy = true
  }
}

module "tfe_workspaces" {
  source = "./module/workspace"

  organization_id         = tfe_organization.this[0].id
  workspace_name          = local.workspaces_list[0].name
  tfe_workspace_variables = local.workspaces_list[0].variables
  tags                    = local.workspaces_list[0].tags
}
