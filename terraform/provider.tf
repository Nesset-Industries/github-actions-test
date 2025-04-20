provider "azurerm" {
  features {}
  use_oidc = true
  use_cli  = false
  use_msi  = false
}
provider "azuread" {
  use_oidc = true
  use_cli  = false
  use_msi  = false
}
