output "vpc_id" {
  value = aws_vpc.main.id
}

output "web_instance_ids" {
  value = aws_instance.web[*].id
}

output "db_instance_id" {
  value = aws_instance.db.id
}

output "load_balancer_dns_name" {
  value = aws_lb.web.dns_name
}
