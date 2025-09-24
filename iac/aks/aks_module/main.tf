resource "azurerm_resource_group" "aks_rg" {
  name     = "triveni-aks-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "triveniaks"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "triveniaks-dns"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "capstone"
  }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


  