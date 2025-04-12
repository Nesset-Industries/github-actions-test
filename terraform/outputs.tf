output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.example.name
}

output "location" {
  description = "Location of the Resource Group"
  value       = azurerm_resource_group.example.location
}