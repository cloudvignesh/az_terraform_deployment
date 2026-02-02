output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "aks_subnet_id" {
  description = "ID of the AKS subnet"
  value       = azurerm_subnet.aks_subnet.id
}

output "aks_appgateway_subnet_id" {
  description = "ID of the AKS app gateway subnet"
  value       = azurerm_subnet.aks_appgateway.id
}

output "aks_virtualkubelet_subnet_id" {
  description = "ID of the AKS virtual kubelet subnet"
  value       = azurerm_subnet.aks_virtualkubelet.id
}

output "subnet_alb_id" {
  description = "ID of the ALB subnet"
  value       = azurerm_subnet.subnet_alb.id
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = azurerm_network_security_group.aks_agentpool.id
}
