# Note: Azure Application Gateway for Containers is not supported via azurerm provider
# The resource "azurerm_application_gateway_for_containers" does not exist in the provider
# 
# Options:
# 1. Use standard Azure Application Gateway (azurerm_application_gateway)
# 2. Use Azure CLI or ARM templates for Application Gateway for Containers
# 3. Use the AzAPI provider for preview/new Azure resources
#
# Temporarily using a null resource to avoid errors
# You'll need to manually configure Application Gateway for Containers

resource "null_resource" "placeholder" {
  triggers = {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
  }
}
