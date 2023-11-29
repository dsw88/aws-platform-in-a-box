resource "aws_vpc" "vpc" {
  cidr_block           = local.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(var.tags, {
    Name = var.name
  })
}
