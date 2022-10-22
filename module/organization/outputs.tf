output "organization_name" {
  value = tfe_organization.this.name
}

output "organization_id" {
  value = tfe_organization.this.id
}

output "variable_set_name" {
  value = tfe_variable_set.this[*].name
}

output "variable_set_id" {
  value = tfe_variable_set.this[*].id
}

output "variable_set_list" {
  value = [for v in tfe_variable_set.this : { name = v.name, id = v.id }]
}

output "variable_id" {
  value = tfe_variable.this[*].id
}
