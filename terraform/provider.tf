provider "azurerm" {
  features {}
  use_oidc        = true
  use_cli         = false
  use_msi         = false
}
