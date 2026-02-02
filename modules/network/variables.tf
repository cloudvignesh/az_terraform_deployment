variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
  default     = "aks-subnet"
}

variable "aks_subnet_address_prefix" {
  description = "Address prefix for AKS subnet"
  type        = string
}

variable "aks_appgateway_subnet_name" {
  description = "Name of the AKS app gateway subnet"
  type        = string
  default     = "aks-appgateway"
}

variable "aks_appgateway_subnet_address_prefix" {
  description = "Address prefix for AKS app gateway subnet"
  type        = string
}

variable "aks_virtualkubelet_subnet_name" {
  description = "Name of the AKS virtual kubelet subnet"
  type        = string
  default     = "aks-virtualkubelet"
}

variable "aks_virtualkubelet_subnet_address_prefix" {
  description = "Address prefix for AKS virtual kubelet subnet"
  type        = string
}

variable "subnet_alb_name" {
  description = "Name of the ALB subnet"
  type        = string
  default     = "subnet-alb"
}

variable "subnet_alb_address_prefix" {
  description = "Address prefix for ALB subnet"
  type        = string
}

variable "tags" {
  description = "Tags to apply to network resources"
  type        = map(string)
  default     = {}
}
