output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "compute_subnet_ids" {
  value = [for subnet in aws_subnet.compute : subnet.id]
}

output "data_subnet_ids" {
  value = [for subnet in aws_subnet.data : subnet.id]
}
