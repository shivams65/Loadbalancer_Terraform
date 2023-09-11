resource "azurerm_bastion_host" "bastion_host" {
  name                = "shivam_bastion_01"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.public_ip.id
  }
}