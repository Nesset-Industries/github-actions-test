# Output the website URL
output "static_website_url" {
  value = azurerm_storage_account.static_website.primary_web_endpoint
}

# Output the CDN URL
output "cdn_endpoint_url" {
  value = "https://${azurerm_cdn_endpoint.static_website.fqdn}"
}