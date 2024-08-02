resource "azurerm_recovery_services_vault" "main" {
  name                = "backupvaultwebinfra"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"
}

resource "azurerm_backup_policy_vm" "daily" {
  name                = "daily-backup-policy"
  resource_group_name = azurerm_resource_group.main.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 30
  }
}

resource "azurerm_backup_protected_vm" "web" {
  count                  = 2
  resource_group_name    = azurerm_resource_group.main.name
  recovery_vault_name    = azurerm_recovery_services_vault.main.name
  source_vm_id           = azurerm_virtual_machine.web[count.index].id
  backup_policy_id       = azurerm_backup_policy_vm.daily.id
}

resource "azurerm_backup_protected_vm" "db" {
  resource_group_name    = azurerm_resource_group.main.name
  recovery_vault_name    = azurerm_recovery_services_vault.main.name
  source_vm_id           = azurerm_virtual_machine.db.id
  backup_policy_id       = azurerm_backup_policy_vm.daily.id
}
