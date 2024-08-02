resource "azurerm_virtual_machine" "web" {
  count                 = 2
  name                  = "web-vm-${count.index}"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.web[count.index].id]
  vm_size               = "Standard_D2s_v3"

  availability_set_id = azurerm_availability_set.web.id

  storage_os_disk {
    name              = "web-os-disk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = 128
  }

  os_profile {
    computer_name  = "webvm${count.index}"
    admin_username = "adminuser"
    admin_password = "Password123!"
  }

  os_profile_windows_config {}

 
}

resource "azurerm_virtual_machine" "db" {
  name                  = "db-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.db.id]
  vm_size               = "Standard_D4s_v3"

  storage_os_disk {
    name              = "db-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = 256
  }

  os_profile {
    computer_name  = "dbvm"
    admin_username = "adminuser"
    admin_password = "Password123!"
  }

  os_profile_windows_config {}

 
}
