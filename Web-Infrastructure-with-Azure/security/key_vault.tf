resource "azurerm_key_vault" "main" {
  name                        = "keyvaultwebinfra"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    secret_permissions = [
      "get",
      "list",
      "set",
    ]
  }
}

resource "azurerm_key_vault_secret" "db_connection_string" {
  name         = "db-connection-string"
  value        = azurerm_sql_server.main.administrator_login_password
  key_vault_id = azurerm_key_vault.main.id
}
