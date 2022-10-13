terraform {
  required_version = "~> 1.13"

  backend "remote" {
    organization = var.tfc_root_org
    workspaces {
      name = var.tfc_root_workspace
    }
  }
}

provider "tfe" {
  token = var.tfc_token
}
