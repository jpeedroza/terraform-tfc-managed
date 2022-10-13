resource "tfe_workspace" "this" {
  organization = var.organization_id

  name              = var.workspace_name
  terraform_version = var.terraform_version
  tag_names         = var.tags
}

resource "tfe_variable" "this" {
  for_each    = { for k, v in var.tfe_workspace_variables : k => v }
  key         = upper(each.value.key)
  value       = each.value.value
  category    = each.value.category
  description = each.value.description

  workspace_id = tfe_workspace.this.id
}

resource "tfe_workspace_variable_set" "this" {
  variable_set_id = tfe_variable.this.id
  workspace_id    = tfe_workspace.this.id
}
