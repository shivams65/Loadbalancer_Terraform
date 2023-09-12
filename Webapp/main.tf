resource "azurerm_service_plan" "appserviceplan" {
  name                = var.app_serviceplan_name
  resource_group_name = var.rg_name
  location            = var.location
 sku_name = "B3"
    os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = var.web_app_name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {}
}