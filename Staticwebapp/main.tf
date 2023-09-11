resource "azurerm_static_site" "staticapp" {
  name                = "Staticwebapp"
  resource_group_name = var.rg_name
  location            = var.location
}