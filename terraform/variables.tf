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
