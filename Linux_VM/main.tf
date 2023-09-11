resource "azurerm_network_interface" "Linuxnic" {
    for_each = var.linuxvm
  name                = each.value.nicname
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
    for_each = var.linuxvm
  name                = each.value.vmname
  resource_group_name = var.rgname
  location            = var.location
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.keyvaultsecret1.value
  admin_password =  data.azurerm_key_vault_secret.keyvaultsecret2.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.Linuxnic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}