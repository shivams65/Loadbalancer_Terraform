data "azurerm_subnet" "subnet" {
  name                 = "my-subnet1"
  virtual_network_name = "shivam-vnet"
  resource_group_name  = "Shivam-Resourcegroup"
}

data "azurerm_key_vault" "keyvault" {
  name                = "Vmuserlogin-Shivam"
  resource_group_name = "Shivam-Resourcegroup"
}

data "azurerm_key_vault_secret" "keyvaultsecret1" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
data "azurerm_key_vault_secret" "keyvaultsecret2" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}