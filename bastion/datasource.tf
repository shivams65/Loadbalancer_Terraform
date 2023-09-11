data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "shivam-vnet"
  resource_group_name  = "Shivam-resourcegroup"
}

data "azurerm_public_ip" "public_ip" {
  name                = "shivampublicip01"
  resource_group_name = "Shivam-resourcegroup"
}