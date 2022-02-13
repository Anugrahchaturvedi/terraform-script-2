//this is base cluster

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${azurerm_resource_group.aks.name}-cluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "exampleaks1"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks.name}-node-rg"

  default_node_pool {
    name                 = "systempool"
    vm_size              = "Standard_DS2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    availability_zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 2
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id =     azurerm_subnet.akspodssubnet.id
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = "dev"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = "dev"
    }

  }

  identity {
    type = "SystemAssigned"
  }



  // some add on block
  addon_profile {
    azure_policy {
      enabled = true
    }


    //log analytics agent for the linux VMs
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
    }
  }
  #RBAC & Azure ad Integration
  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = true
      admin_group_object_ids = [azuread_group.aks_administrators.object_id]
    }
  }
  #windows Profile
  windows_profile {
    admin_username = var.windows_admin_name
    admin_password = var.windows_admin_password
  }
  #linux Profile
  linux_profile {
    admin_username = "anugrah"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }



  #Network Profile
  network_profile {
    network_plugin = "azure"
    # network_policy = "azure"
     service_cidr      = var.aksservicecidr
    docker_bridge_cidr = var.dockercidrip
    dns_service_ip    = var.aksdns

  }

  tags = {
    Environment = "Production"
  }
}
