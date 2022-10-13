variable "organization_id" {
  type = string
}

variable "workspace_name" {
  type = string
}

variable "terraform_version" {
  type    = string
  default = "1.13"
}

variable "tfe_workspace_variables" {
  type = list(object({
    key         = string
    value       = string
    category    = optional(string, "terraform")
    description = optional(string, "Created using the repo https://github.com/jpeedroza/terraform-tfc-managed")
  }))
}

variable "tags" {
  type    = set(string)
  default = []
}

