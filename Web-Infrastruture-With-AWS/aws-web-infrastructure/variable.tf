variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication"
  type        = string
  default     = "default"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  description = "The CIDR block for the web tier subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  description = "The CIDR block for the database tier subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "web_instance_type" {
  description = "The instance type for the web tier EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "db_instance_type" {
  description = "The instance type for the database tier EC2 instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "environment" {
  description = "The environment (production, staging, etc.)"
  type        = string
}
