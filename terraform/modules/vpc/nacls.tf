resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [for subnet in aws_subnet.public : subnet.id]

  ingress {
    rule_no    = 5
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = local.vpc_cidr_block
  }

  ingress {
    rule_no    = 10
    action     = "allow"
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = local.all_traffic_cidr
  }

  ingress {
    rule_no    = 15
    action     = "allow"
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = local.all_traffic_cidr
  }

  egress {
    rule_no    = 5
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = local.vpc_cidr_block
  }

  egress {
    rule_no    = 10
    action     = "allow"
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = local.all_traffic_cidr
  }

  egress {
    rule_no    = 15
    action     = "allow"
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = local.all_traffic_cidr
  }

  tags = merge(var.tags, {
    Name = "${var.name}-public"
  })
}

resource "aws_network_acl" "compute" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [for subnet in aws_subnet.compute : subnet.id]

  ingress {
    rule_no    = 5
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = local.vpc_cidr_block
  }

  ingress {
    rule_no    = 10
    action     = "allow"
    protocol   = "tcp"
    from_port  = 1024
    to_port    = 65535
    cidr_block = local.all_traffic_cidr
  }

  egress {
    rule_no    = 5
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = local.vpc_cidr_block
  }

  egress {
    rule_no    = 10
    action     = "allow"
    protocol   = "tcp"
    from_port  = 443
    to_port    = 443
    cidr_block = local.all_traffic_cidr
  }

  tags = merge(var.tags, {
    Name = "${var.name}-compute"
  })
}

resource "aws_network_acl" "data" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [for subnet in aws_subnet.data : subnet.id]

  ingress {
    rule_no    = 5
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = local.vpc_cidr_block
  }

  egress {
    rule_no    = 5
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = local.vpc_cidr_block
  }

  tags = merge(var.tags, {
    Name = "${var.name}-data"
  })
}
