data "azurerm_subnet" "subnet" {
  name                 = "my-subnet1"
  virtual_network_name = "shivam-vnet"
  resource_group_name  = "Shivam-resourcegroup"
}