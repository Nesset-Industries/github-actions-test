variable "azure_client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "example-rg"
}

variable "location" {
  description = "Azure Region for Resource Group"
  type        = string
  default     = "West Europe"
}
