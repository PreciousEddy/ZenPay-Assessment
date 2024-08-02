Here is the raw README file content for your repository:

```markdown
# ZenPay-Assessment
# Web Infrastructure Provisioning

This repository contains Terraform configurations to provision a web infrastructure stack on Azure.

# Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure account and necessary permissions
- Service Principal for authentication

# File Directory

```python
web-infrastructure-assessment/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── network/
│   ├── vnet.tf
│   ├── subnets.tf
│   ├── nsgs.tf
│   ├── network_interfaces.tf
├── compute/
│   ├── availability_set.tf
│   ├── virtual_machines.tf
├── load_balancer/
│   ├── public_ip.tf
│   ├── load_balancer.tf
│   ├── backend_pool.tf
│   ├── health_probe.tf
│   ├── load_balancing_rule.tf
├── application_gateway/
│   ├── public_ip.tf
│   ├── application_gateway.tf
├── sql_database/
│   ├── sql_server.tf
│   ├── sql_database.tf
│   ├── sql_firewall_rule.tf
├── security/
│   ├── key_vault.tf
│   ├── backup.tf
│   ├── security_center.tf
├── README.md
```

# Directory Breakdown

## web-infrastructure-assessment/
- **main.tf**: The main configuration file to include and reference the other module files.
- **variables.tf**: Definitions of variables used across the project.
- **terraform.tfvars**: Variable values (sensitive data like credentials should be managed securely and not committed to the repository).
- **outputs.tf**: Output variables to display useful information after deployment.

## network/
- **vnet.tf**: Virtual Network configuration.
- **subnets.tf**: Subnet configurations for web and database tiers.
- **nsgs.tf**: Network Security Groups for the subnets.
- **network_interfaces.tf**: Network interfaces for VMs.

## compute/
- **availability_set.tf**: Configuration for the availability set.
- **virtual_machines.tf**: Virtual machine configurations.

## load_balancer/
- **public_ip.tf**: Public IP configuration for the load balancer.
- **load_balancer.tf**: Load balancer configuration.
- **backend_pool.tf**: Backend pool configuration.
- **health_probe.tf**: Health probe configuration.
- **load_balancing_rule.tf**: Load balancing rule configuration.

## application_gateway/
- **public_ip.tf**: Public IP configuration for the application gateway.
- **application_gateway.tf**: Application gateway configuration.

## sql_database/
- **sql_server.tf**: SQL Server configuration.
- **sql_database.tf**: SQL Database configuration.
- **sql_firewall_rule.tf**: SQL Firewall rule configuration.

## security/
- **key_vault.tf**: Azure Key Vault configuration.
- **backup.tf**: Azure Backup configuration.
- **security_center.tf**: Azure Security Center configuration.

# Deployment

Clone the repository:

```sh
git clone https://github.com/yourusername/web-infrastructure-assessment.git
cd web-infrastructure-assessment
```

# Components

- **Virtual Network**: Creates a VNet with address space 10.0.0.0/16.
- **Subnets**: Creates two subnets for web and database tiers.
- **NSGs**: Configures security groups for the subnets.
- **Virtual Machines**: Creates VMs for web and database tiers.
- **Load Balancer**: Configures a standard Azure Load Balancer.
- **Application Gateway**: Sets up an Application Gateway.
- **Azure SQL Database**: Provisions an SQL Database.
- **Security**: Implements Key Vault, Backup, and Security Center configurations.

# Workflow

This workflow does the following:

- Checks out the code from your repository.
- Sets up Terraform.
- Logs into Azure using the Service Principal credentials stored in the repository secrets.
- Initializes Terraform.
- Runs `terraform plan` to show the changes.
- Runs `terraform apply` to apply the changes if the branch is `main`.
```