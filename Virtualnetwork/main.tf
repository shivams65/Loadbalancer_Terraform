resource "azurerm_virtual_network" "virtualnetwork" {

  name                = "shivam-vnet"
  location            = "east us"
  resource_group_name = "Shivam-resourcegroup"
  address_space       = ["10.0.0.0/16"]

  dynamic "subnet" {

    for_each = var.subnet

    content {

      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }

  }
}