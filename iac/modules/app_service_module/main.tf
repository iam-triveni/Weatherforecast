provider "azurerm" {
  features {}
  #subscription_id = "606e824b-aaf7-4b4e-9057-b459f6a4436d"
}

resource "azurerm_resource_group" "rg" {
  name     = "tm-rg-appservice"
  location = var.location
}

resource "azurerm_service_plan" "app_plan" {
  name                = "triveni-appservice-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type  = "Linux"
  sku_name = "F1"
}
