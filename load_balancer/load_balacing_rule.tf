resource "azurerm_lb_rule" "http" {
  name                           = "http-rule"
 # resource_group_name            = azurerm_resource_group.main.name
  loadbalancer_id                = azurerm_lb.main.id
  frontend_ip_configuration_name = "frontend"
 # backend_address_pool_id        = azurerm_lb_backend_address_pool.main.id
  probe_id                       = azurerm_lb_probe.http.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  idle_timeout_in_minutes        = 4
  enable_floating_ip             = false
}