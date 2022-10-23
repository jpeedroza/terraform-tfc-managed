locals {
  # Create a list of objects which contains the ID associated of variable_set to link and all the content to create a variable 
  variables_to_create = flatten([
    for org in var.variable_list : [
      for index, variables in org.variables :
      merge(variables, {
        for v in tfe_variable_set.this :
        "id" => v.id
      if v.name == org.name })
    ]
  ])
}

resource "tfe_organization" "this" {
  name  = var.name
  email = var.email
}

resource "tfe_variable_set" "this" {
  count        = length(var.variable_list)
  name         = var.variable_list[count.index].name
  description  = var.variable_list[count.index].description
  global       = var.variable_list[count.index].global
  organization = tfe_organization.this.name
}

resource "tfe_variable" "this" {
  count           = length(local.variables_to_create)
  key             = local.variables_to_create[count.index].key
  category        = local.variables_to_create[count.index].category
  description     = local.variables_to_create[count.index].description
  value           = local.variables_to_create[count.index].value
  sensitive       = local.variables_to_create[count.index].sensitive
  variable_set_id = local.variables_to_create[count.index].id
}
