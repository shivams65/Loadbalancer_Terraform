data "azurerm_public_ip" "public_ip" {
  name                = "PublicIPForLB"
  resource_group_name = "Shivam-resourcegroup"
}

data "azurerm_virtual_network" "vnet" {
  name                = "shivam-vnet"
  resource_group_name = "Shivam-resourcegroup"
}

data "azurerm_virtual_machine" "virtualmachine" {
  for_each = var.vm
  name                = each.value.name
  resource_group_name = var.rg_name
}