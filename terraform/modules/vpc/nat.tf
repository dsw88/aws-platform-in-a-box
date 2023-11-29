resource "aws_nat_gateway" "nat" {
  depends_on    = [aws_internet_gateway.gateway]
  for_each      = local.public_config
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.key].id
  tags = merge(var.tags, {
    Name = "${var.name}-${each.key}"
  })
}

resource "aws_eip" "nat" {
  for_each = local.public_config
  domain   = "vpc"
  tags     = var.tags
}
