terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-nesset-github-actions-test-state"
    storage_account_name = "sagithubactionstesttne"
    container_name       = "sc-state"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "static_website" {
  name     = var.static_website_resource_group_name
  location = var.location
  
}

resource "azurerm_storage_account" "static_website" {
  name                     = var.static_website_storage_account_name
  resource_group_name      = azurerm_resource_group.static_website.name
  location                 = azurerm_resource_group.static_website.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  tags = var.tags
}

resource "azurerm_storage_account_static_website" "static_website" {
  storage_account_id = azurerm_storage_account.static_website.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

resource "azurerm_cdn_profile" "static_website" {
  name                = var.cdn_profile_name
  resource_group_name = azurerm_resource_group.static_website.name
  location            = azurerm_resource_group.static_website.location
  sku                 = "Standard_Microsoft"

  tags = var.tags
}

resource "azurerm_cdn_endpoint" "static_website" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.static_website.name
  location            = azurerm_resource_group.static_website.location
  resource_group_name = azurerm_resource_group.static_website.name

  origin {
    name      = "staticwebsite"
    host_name = azurerm_storage_account.static_website.primary_web_host
  }

  tags = var.tags
}