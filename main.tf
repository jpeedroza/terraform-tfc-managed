resource "tfe_organization" "this" {
  count = length(local.config.organization)
  name  = local.config.organization.name
  email = local.config.organization.name

  lifecycle {
    prevent_destroy = true
  }
}

module "tfe_workspaces" {

}
