terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.72.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Shivam-resourcegroup"
    storage_account_name = "sa11092023"
    container_name       = "tfstate"
    key                  = "public_ip/prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}