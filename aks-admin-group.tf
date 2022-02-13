resource "azuread_group" "aks_administrators" {
  display_name     = "${azurerm_resource_group.aks.name}-cluster-administrators"
  description      = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks.name}-cluster."
  security_enabled = true
}
