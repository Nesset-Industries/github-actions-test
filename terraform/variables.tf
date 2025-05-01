variable "example_resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "example-rg"
}

variable "static_website_resource_group_name" {
  description = "Name of the Static Website Resource Group"
  type        = string
  default     = "static-website-rg"
}

variable "static_website_storage_account_name" {
  description = "Name of the Static Website Storage Account"
  type        = string
  default     = "tnesastaticwebsite"
}

variable "cdn_profile_name" {
  description = "Name of the CDN Profile"
  type        = string
  default     = "tnesacdnprofile"
}

variable "cdn_endpoint_name" {
  description = "Name of the CDN Endpoint"
  type        = string
  default     = "tnesacdnendpoint"
}

variable "location" {
  description = "Azure Region for Resource Group"
  type        = string
  default     = "West Europe"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {
    environment = "prod"
    project     = "github-actions"
    managed_by  = "terraform"
  }
}