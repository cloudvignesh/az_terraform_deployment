output "id" {
  description = "ID of the Application Gateway for Containers"
  value       = azurerm_application_gateway_for_containers.this.id
}

output "name" {
  description = "Name of the Application Gateway for Containers"
  value       = azurerm_application_gateway_for_containers.this.name
}
