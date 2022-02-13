//this is my Custom Vnet
resource "azurerm_virtual_network" "clustervnet" {
    name                        = "vnet"
    location                    = azurerm_resource_group.aks.location
    resource_group_name         = azurerm_resource_group.aks.name
    address_space               = [var.address_space]
    
}

resource "azurerm_subnet" "akspodssubnet" {
    name                        = "akspodssubnet"
    resource_group_name         = azurerm_resource_group.aks.name
    virtual_network_name        = azurerm_virtual_network.clustervnet.name
    address_prefix              = var.akspodssubnet
}
