resource "azurerm_sql_server" "main" {
  name                         = "sqlserverwebinfra"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"

  tags = {
    environment = "production"
  }
}