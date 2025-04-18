terraform {
  cloud {
    organization = "thomas-nesset"

    workspaces {
      name = "github-actions-test"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}