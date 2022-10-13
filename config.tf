data "local_file" "this" {
  filename = "${path.module}/config/values.yml"
}

locals {
  config = yamldecode(data.local_file.this.content)
}
