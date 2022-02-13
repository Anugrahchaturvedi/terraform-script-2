
//this is for creating one log workspace for monitoring our Cluster


resource "azurerm_log_analytics_workspace" "insights" {
  # name= "logs-${random_pet.aksrandom.id}"  //this will generate random name for log workspace
  name = "logs-91185888798788"
  location=azurerm_resource_group.aks.location
  resource_group_name=azurerm_resource_group.aks.name

}