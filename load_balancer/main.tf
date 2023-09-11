resource "azurerm_lb" "Loadbalancer" {
  name                = "shivam-loadbalancer"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backendaddresspool" {
  loadbalancer_id = azurerm_lb.Loadbalancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "backendaddresspool_address_01" {
  name                    = "linuxvm01"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendaddresspool.id
  virtual_network_id      = data.azurerm_virtual_network.vnet.id
  ip_address              = "10.0.1.5"
}

resource "azurerm_lb_backend_address_pool_address" "backendaddresspool_address_02" {
  name                    = "linuxvm02"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendaddresspool.id
  virtual_network_id      = data.azurerm_virtual_network.vnet.id
  ip_address              = "10.0.1.4"
}

resource "azurerm_lb_rule" "lbrule" {
  loadbalancer_id                = azurerm_lb.Loadbalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.backendaddresspool.id]
  probe_id = azurerm_lb_probe.lbhealthprobe.id
}

resource "azurerm_lb_probe" "lbhealthprobe" {
  loadbalancer_id = azurerm_lb.Loadbalancer.id
  name            = "http-running-probe"
  port            = 80
}

