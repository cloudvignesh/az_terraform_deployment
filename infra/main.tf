terraform {
  required_version = "1.13.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstoragethreetierapp"
    container_name       = "tfstate"
    key                  = "three-tier-app.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "d102fa39-6771-4629-94e2-e6847560fbae"
  resource_provider_registrations = "none"
}

# Primary Resource Group
module "resource_group" {
  source   = "../modules/resource-group"
  name     = var.primary_rg_name
  location = var.location
  tags     = var.tags
}

# Network (VNet and Subnets) - This will be created in the AKS node resource group
# Note: This module would typically be in the MC_ resource group created by AKS
# For manual creation, we create it in primary RG and reference in AKS
module "network" {
  source              = "../modules/network"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  nsg_name            = var.nsg_name
  
  aks_subnet_name                        = var.aks_subnet_name
  aks_subnet_address_prefix              = var.aks_subnet_address_prefix
  aks_appgateway_subnet_name             = var.aks_appgateway_subnet_name
  aks_appgateway_subnet_address_prefix   = var.aks_appgateway_subnet_address_prefix
  aks_virtualkubelet_subnet_name         = var.aks_virtualkubelet_subnet_name
  aks_virtualkubelet_subnet_address_prefix = var.aks_virtualkubelet_subnet_address_prefix
  subnet_alb_name                        = var.subnet_alb_name
  subnet_alb_address_prefix              = var.subnet_alb_address_prefix
  
  tags = var.tags
}

# Managed Identity for ALB
module "alb_identity" {
  source              = "../modules/managed-identity"
  name                = var.alb_identity_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# Container Registry
module "container_registry" {
  source              = "../modules/container-registry"
  name                = var.acr_name
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}

# AKS Cluster
module "aks_cluster" {
  source              = "../modules/aks"
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = module.resource_group.name
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool = {
    name                = var.aks_node_pool_name
    node_count          = var.aks_node_count
    vm_size             = var.aks_vm_size
    os_disk_size_gb     = var.aks_os_disk_size_gb
    vnet_subnet_id      = module.network.aks_subnet_id
    enable_auto_scaling = var.aks_enable_auto_scaling
    min_count           = var.aks_min_count
    max_count           = var.aks_max_count
  }

  identity_type = var.aks_identity_type
  
  network_profile = {
    network_plugin     = var.aks_network_plugin
    network_policy     = var.aks_network_policy
    service_cidr       = var.aks_service_cidr
    dns_service_ip     = var.aks_dns_service_ip
    load_balancer_sku  = var.aks_load_balancer_sku
  }

  tags = var.tags

  depends_on = [module.network]
}

# Application Gateway for Containers
module "application_gateway" {
  source              = "../modules/application-gateway"
  name                = var.alb_name
  location            = var.location
  resource_group_name = module.resource_group.name
  identity_ids        = [module.alb_identity.id]
  tags                = var.tags
}
