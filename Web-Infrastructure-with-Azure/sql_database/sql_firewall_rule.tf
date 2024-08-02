resource "azurerm_sql_firewall_rule" "allow_azure_services" {
  name                = "allow_azure_services"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_sql_server.main.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}