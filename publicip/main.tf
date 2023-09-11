resource "azurerm_public_ip" "publicip" {
  for_each            = var.public_ip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
