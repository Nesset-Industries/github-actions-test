terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Configure the azurerm backend
  backend "azurerm" {
    resource_group_name  = "rg-nesset-github-actions-test-state"      
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}