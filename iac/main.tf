provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-demo-appservice"
  location = variable.location
}

resource "azurerm_service_plan" "app_plan" {
  name                = "demo-appservice-plan-2025-xyz"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind     = "Linux"
  os_type  = "Linux"
  sku_name = "B1"
}

resource "azurerm_app_service" "app" {
  name                = "demo-webapp-terraform-2025-xyz"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id

  site_config {
    linux_fx_version = "DOTNETCORE|8.0"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
