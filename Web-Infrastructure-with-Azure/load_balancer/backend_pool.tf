resource "azurerm_lb_backend_address_pool" "main" {
  name                = "backend-pool"
 # resource_group_name = azurerm_resource_group.main.name
  loadbalancer_id     = azurerm_lb.main.id
}