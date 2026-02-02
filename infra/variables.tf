variable "primary_rg_name" {
  description = "Name of the primary resource group"
  type        = string
  default     = "three-tier-application"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralindia"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  # default = {
  #   Environment = "Production"
  #   ManagedBy   = "Terraform"
  #   Project     = "ThreeTierApp"
  # }
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "aks-vnet-23243803"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.224.0.0/12"]
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
  default     = "aks-agentpool-23243803-nsg"
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
  default     = "aks-subnet"
}

variable "aks_subnet_address_prefix" {
  description = "Address prefix for AKS subnet"
  type        = string
  default     = "10.224.0.0/16"
}

variable "aks_appgateway_subnet_name" {
  description = "Name of the AKS app gateway subnet"
  type        = string
  default     = "aks-appgateway"
}

variable "aks_appgateway_subnet_address_prefix" {
  description = "Address prefix for AKS app gateway subnet"
  type        = string
  default     = "10.238.0.0/24"
}

variable "aks_virtualkubelet_subnet_name" {
  description = "Name of the AKS virtual kubelet subnet"
  type        = string
  default     = "aks-virtualkubelet"
}

variable "aks_virtualkubelet_subnet_address_prefix" {
  description = "Address prefix for AKS virtual kubelet subnet"
  type        = string
  default     = "10.239.0.0/16"
}

variable "subnet_alb_name" {
  description = "Name of the ALB subnet"
  type        = string
  default     = "subnet-alb"
}

variable "subnet_alb_address_prefix" {
  description = "Address prefix for ALB subnet"
  type        = string
  default     = "10.225.0.0/24"
}

variable "alb_identity_name" {
  description = "Name of the managed identity for ALB"
  type        = string
  default     = "azure-alb-identity"
}

variable "acr_name" {
  description = "Name of the container registry"
  type        = string
  default     = "threetierapp"
}

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "acr_admin_enabled" {
  description = "Enable admin user for ACR"
  type        = bool
  default     = false
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "webapp-k8s-cluster"
}

variable "aks_dns_prefix" {
  description = "DNS prefix for AKS cluster"
  type        = string
  default     = "webapp-k8s"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.27"
}

variable "aks_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "nodepool1"
}

variable "aks_node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 3
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "aks_os_disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 30
}

variable "aks_enable_auto_scaling" {
  description = "Enable auto-scaling for node pool"
  type        = bool
  default     = true
}

variable "aks_min_count" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "aks_max_count" {
  description = "Maximum number of nodes"
  type        = number
  default     = 5
}

variable "aks_identity_type" {
  description = "Identity type for AKS"
  type        = string
  default     = "SystemAssigned"
}

variable "aks_network_plugin" {
  description = "Network plugin for AKS"
  type        = string
  default     = "azure"
}

variable "aks_network_policy" {
  description = "Network policy for AKS"
  type        = string
  default     = "azure"
}

variable "aks_service_cidr" {
  description = "Service CIDR for AKS"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "DNS service IP for AKS"
  type        = string
  default     = "10.0.0.10"
}

variable "aks_load_balancer_sku" {
  description = "Load balancer SKU"
  type        = string
  default     = "standard"
}

variable "alb_name" {
  description = "Name of the Application Gateway"
  type        = string
  default     = "alb-web-app-test"
}
