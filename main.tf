module "tfe_organization" {
  source        = "./module/organization"
  count         = length(local.config.organizations)
  name          = local.config.organizations[count.index].name
  email         = local.config.organizations[count.index].email
  variable_list = try(local.config.organizations[count.index].groupVariables[*], [])
}

module "tfe_workspaces" {
  source                       = "./module/workspace"
  count                        = length(module.tfe_organization)
  organization_name            = module.tfe_organization[count.index].organization_name
  organization_variable_set_id = module.tfe_organization[count.index].variable_set_list
  workspace_content            = local.config.organizations[count.index].workspaces

  depends_on = [
    module.tfe_organization
  ]
}
