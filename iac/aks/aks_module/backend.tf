terraform {
  backend "azurerm" {
    resource_group_name  = "triveni-aks-rg"
    storage_account_name = "trivenistorageaccount"
    container_name       = "tfstate"
    key                  = "aks.terraform.tfstate"
  }
}
