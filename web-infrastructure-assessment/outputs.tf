output "web_vm_private_ips" {
  value = [for vm in azurerm_virtual_machine.web : vm.private_ip_address]
}

output "db_vm_private_ip" {
  value = azurerm_virtual_machine.db.private_ip_address
}

output "load_balancer_ip" {
  value = azurerm_public_ip.lb.ip_address
}

output "application_gateway_ip" {
  value = azurerm_public_ip.appgw.ip_address
}

output "sql_server_fqdn" {
  value = azurerm_sql_server.main.fully_qualified_domain_name
}
