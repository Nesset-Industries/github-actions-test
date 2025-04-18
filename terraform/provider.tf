provider "azurerm" {
  features {}

  client_id       = var.azure_client_id
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id

  use_oidc        = true
  use_cli         = false
  use_msi         = false
}
