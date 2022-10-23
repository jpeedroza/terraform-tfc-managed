locals {
  workspace_name           = var.workspace_content[*].name
  workspace_tags           = var.workspace_content[*].tags
  workspace_execution_mode = var.workspace_content[*].executionMode

  # Create a list of objects which contains the ID associated of the workspace to link and all the content to create a variable 
  tfe_workspace_variables = flatten([
    for workspace in var.workspace_content : [
      for variables in workspace.variables :
      merge(variables, {
        for tfe_workspace in tfe_workspace.this :
        "id" => tfe_workspace.id
      if tfe_workspace.name == workspace.name })
    ]
    if workspace.variables != null
  ])

  # Create a list of objects which contains the ID associated of variable_set to link with the workspace ID 
  tfe_workspace_variables_sets = flatten([
    for workspace in var.workspace_content : [
      for groups in flatten(workspace.useGroupVariables) : merge(
        {
          for id_list in var.organization_variable_set_id :
          "id_set" => id_list.id
          if id_list.name == groups
        },
        {
          for id_work in tfe_workspace.this :
          "id_workspace" => id_work.id
          if id_work.name == workspace.name
        }
      )
    ]
    if workspace.useGroupVariables != null
  ])
}

resource "tfe_workspace" "this" {
  count             = length(var.workspace_content)
  name              = local.workspace_name[count.index]
  execution_mode    = local.workspace_execution_mode[count.index]
  tag_names         = concat(local.workspace_tags[count.index], ["managed-by-script", "terraform"])
  terraform_version = format("~> %s", var.terraform_version)
  organization      = var.organization_name
}

resource "tfe_variable" "this" {
  count        = length(local.tfe_workspace_variables)
  key          = local.tfe_workspace_variables[count.index].key
  value        = local.tfe_workspace_variables[count.index].value
  category     = local.tfe_workspace_variables[count.index].category
  sensitive    = local.tfe_workspace_variables[count.index].sensitive
  description  = local.tfe_workspace_variables[count.index].description
  workspace_id = local.tfe_workspace_variables[count.index].id

  depends_on = [
    tfe_workspace.this
  ]
}

resource "tfe_workspace_variable_set" "this" {
  count           = length(local.tfe_workspace_variables_sets)
  variable_set_id = local.tfe_workspace_variables_sets[count.index].id_set
  workspace_id    = local.tfe_workspace_variables_sets[count.index].id_workspace

  depends_on = [
    tfe_workspace.this
  ]
}
