resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  tags = {
    Name = "default"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "default"
  }
}

resource "aws_subnet" "default-us-east-1a" {
  tags = {
    Name                            = "default-us-east-1a"
    "kubernetes.io/cluster/default" = "shared"
    "kubernetes.io/role/elb"        = 1
  }
  map_public_ip_on_launch = "true"
  vpc_id                  = aws_vpc.default.id
  availability_zone       = "us-east-1a"
  cidr_block              = cidrsubnet(aws_vpc.default.cidr_block, 4, 1)
}

resource "aws_subnet" "default-us-east-1b" {
  tags = {
    Name                            = "default-us-east-1b"
    "kubernetes.io/cluster/default" = "shared"
    "kubernetes.io/role/elb"        = 1
  }
  map_public_ip_on_launch = "true"
  vpc_id                  = aws_vpc.default.id
  availability_zone       = "us-east-1b"
  cidr_block              = cidrsubnet(aws_vpc.default.cidr_block, 4, 2)
}