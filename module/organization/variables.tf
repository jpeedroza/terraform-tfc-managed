variable "name" {
  type = string
}

variable "email" {
  type = string
}

variable "variable_list" {
  type = list(object({
    name        = string
    description = optional(string)
    global      = optional(bool, false)
    variables = optional(list(object({
      key         = string
      value       = string
      category    = optional(string, "terraform")
      description = optional(string, "Created using the repo https://github.com/jpeedroza/terraform-tfc-managed")
      sensitive   = optional(bool, false)
    })), [])
  }))
}
