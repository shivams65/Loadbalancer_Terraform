resource "azurerm_resource_group" "resourcegroup" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
}