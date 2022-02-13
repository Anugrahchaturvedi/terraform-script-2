
output "location" {
    value=azurerm_resource_group.aks.location
  }
   output "resource_group_id" {
   value = azurerm_resource_group.aks.id
 }

 output "version" {
     value = data.azurerm_kubernetes_service_versions.current.latest_version
     }
output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
  }
  output "aks_cluster_name" {
   value= azurerm_kubernetes_cluster.aks_cluster.name
  }
output "azure_ad_group" {
  value= azuread_group.aks_administrators.object_id
}