data "local_file" "this" {
  filename = "${path.module}/config/values.yaml"
}

locals {
  config          = yamldecode(data.local_file.this.content)
  workspaces_list = flatten(local.config.organizations[*].workspaces)
}
