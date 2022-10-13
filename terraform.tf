terraform {
  required_version = "~> 1.3"

  backend "remote" {}
}

provider "tfe" {
  token = var.tfc_token
}
