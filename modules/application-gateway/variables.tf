variable "name" {
  description = "Name of the Application Gateway for Containers"
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

variable "identity_ids" {
  description = "List of user assigned identity IDs"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the Application Gateway"
  type        = map(string)
  default     = {}
}
