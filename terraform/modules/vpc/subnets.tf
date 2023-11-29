resource "aws_subnet" "public" {
  for_each   = local.public_config
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block
  tags = merge(var.tags, {
    Name = "${var.name}-public-${each.key}"
  })
}

resource "aws_subnet" "compute" {
  for_each   = local.compute_config
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block
  tags = merge(var.tags, {
    Name = "${var.name}-private-${each.key}"
  })
}

resource "aws_subnet" "data" {
  for_each   = local.data_config
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block
  tags = merge(var.tags, {
    Name = "${var.name}-data-${each.key}"
  })
}
