resource "aws_route_table" "public" {
  for_each = local.public_config
  vpc_id   = aws_vpc.vpc.id

  route {
    cidr_block = local.all_traffic_cidr
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = merge(var.tags, {
    Name = "${var.name}-public-${each.key}"
  })
}

resource "aws_route_table" "compute" {
  for_each = local.compute_config
  vpc_id   = aws_vpc.vpc.id

  route {
    cidr_block = local.all_traffic_cidr
    gateway_id = aws_nat_gateway.nat[each.key].id
  }

  tags = merge(var.tags, {
    Name = "${var.name}-compute-${each.key}"
  })
}

resource "aws_route_table" "data" {
  for_each = local.data_config
  vpc_id   = aws_vpc.vpc.id

  route {
    cidr_block = local.all_traffic_cidr
    gateway_id = aws_nat_gateway.nat[each.key].id
  }

  tags = merge(var.tags, {
    Name = "${var.name}-data-${each.key}"
  })
}
