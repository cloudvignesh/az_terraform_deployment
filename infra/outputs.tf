output "resource_group_name" {
  description = "Name of the primary resource group"
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID of the primary resource group"
  value       = module.resource_group.id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.network.vnet_id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.network.vnet_name
}

output "aks_subnet_id" {
  description = "ID of the AKS subnet"
  value       = module.network.aks_subnet_id
}

output "aks_appgateway_subnet_id" {
  description = "ID of the AKS app gateway subnet"
  value       = module.network.aks_appgateway_subnet_id
}

output "aks_virtualkubelet_subnet_id" {
  description = "ID of the AKS virtual kubelet subnet"
  value       = module.network.aks_virtualkubelet_subnet_id
}

output "subnet_alb_id" {
  description = "ID of the ALB subnet"
  value       = module.network.subnet_alb_id
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = module.network.nsg_id
}

output "alb_identity_id" {
  description = "ID of the ALB managed identity"
  value       = module.alb_identity.id
}

output "alb_identity_principal_id" {
  description = "Principal ID of the ALB managed identity"
  value       = module.alb_identity.principal_id
}

output "container_registry_id" {
  description = "ID of the container registry"
  value       = module.container_registry.id
}

output "container_registry_login_server" {
  description = "Login server of the container registry"
  value       = module.container_registry.login_server
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster"
  value       = module.aks_cluster.id
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = module.aks_cluster.name
}

output "aks_cluster_fqdn" {
  description = "FQDN of the AKS cluster"
  value       = module.aks_cluster.fqdn
}

output "aks_kube_config" {
  description = "Kubeconfig for the AKS cluster"
  value       = module.aks_cluster.kube_config
  sensitive   = true
}

output "aks_node_resource_group" {
  description = "Resource group for AKS nodes"
  value       = module.aks_cluster.node_resource_group
}

output "application_gateway_id" {
  description = "ID of the Application Gateway"
  value       = module.application_gateway.id
}
