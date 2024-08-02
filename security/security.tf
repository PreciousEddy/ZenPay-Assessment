resource "azurerm_security_center_contact" "main" {
  email = "edmundprecious23@gmail.com"
  phone = "+2348148551915"
  alert_notifications = true
  alerts_to_admins    = true
}

resource "azurerm_security_center_subscription_pricing" "main" {
  tier = "Standard"
}
