terraform {
  required_version = "~> 1.3"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2.0"
    }
  }
}

provider "tfe" {
  token = var.tfc_token
}
