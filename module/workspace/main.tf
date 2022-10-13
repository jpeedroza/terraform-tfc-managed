resource "tfe_workspace" "this" {
  organization      = var.organization_id
  name              = var.workspace_name
  terraform_version = format("~> %s", var.terraform_version)
  tag_names         = concat(["managed-by-script", "terraform"], tolist(var.tags))
}

resource "tfe_variable" "this" {
  for_each    = { for k, v in var.tfe_workspace_variables : k => v }
  key         = each.value.key
  value       = each.value.value
  category    = each.value.category
  description = each.value.description

  workspace_id = tfe_workspace.this.id
}

resource "tfe_workspace_variable_set" "this" {
  count           = length(var.tfe_workspace_variables)
  variable_set_id = tfe_variable.this[count.index].id
  workspace_id    = tfe_workspace.this.id
}
