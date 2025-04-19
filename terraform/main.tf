terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Configure the azurerm backend
  backend "azurerm" {
    resource_group_name  = "rg-nesset-github-actions-test-state"      # The name of the resource group where the storage account exists
    storage_account_name = "sagithubactionsteststate"      # The name of your storage account
    container_name       = "sc-state"    # The name of the container within the storage account
    key                  = "terraform.tfstate" # The path/filename for your state file within the container
  }
}

# Your resource blocks (e.g., resource "azurerm_resource_group" "example" { ... }) go here

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}