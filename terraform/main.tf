terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-nesset-github-actions-test-state"
    storage_account_name = "sagithubactionsteststate"
    container_name       = "sc-state"
    key                  = "terraform.tfstate"
  }
}

locals {
  users_file = jsondecode(file("${path.module}/../ad/users.json"))
  users      = local.users_file.users
}

resource "random_password" "user_password" {
  for_each = { for user in local.users : user.user_principal_name => user }

  length           = 16
  special          = true
  override_special = "!@#$%&*()-_=+[]{}<>:?"
}

resource "azuread_user" "user" {
  for_each = { for user in local.users : user.user_principal_name => user }

  user_principal_name   = each.key
  display_name          = each.value.display_name
  mail_nickname         = each.value.mail_nickname
  password              = random_password.user_password[each.key].result
  force_password_change = false
  job_title             = each.value.job_title
  department            = each.value.department
  usage_location        = each.value.usage_location
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}