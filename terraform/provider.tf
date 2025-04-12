provider "azurerm" {
  features {}

  client_id       = var.azure.client_id
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
}