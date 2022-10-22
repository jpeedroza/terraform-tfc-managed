variable "organization_name" {
  type = string
}

variable "terraform_version" {
  type    = string
  default = "1.3"
}

variable "workspace_content" {
  type = list(object({
    name          = string
    executionMode = string
    variables = list(object({
      key         = string
      value       = string
      category    = optional(string, "terraform")
      description = optional(string, "Created using the repo https://github.com/jpeedroza/terraform-tfc-managed")
      sensitive   = optional(bool, false)
    }))
    useGroupVariables = list(string)
    tags              = list(string)
  }))
}

variable "organization_variable_set_id" {
  type = list(object({
    name = string
    id   = string
  }))
}
