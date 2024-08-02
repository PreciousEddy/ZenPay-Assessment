provider "azurerm" {
  features {}
}

module "network" {
  source = "./network"
}

module "compute" {
  source = "./compute"
}

module "load_balancer" {
  source = "./load_balancer"
}

module "application_gateway" {
  source = "./application_gateway"
}

module "sql_database" {
  source = "./sql_database"
}

module "security" {
  source = "./security"
}
