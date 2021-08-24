# Internet VPC
resource "aws_vpc" "arun-dev" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "arun-dev"
  }
}

# Subnets
resource "aws_subnet" "arun-dev-pub-sub-1" {
  vpc_id                  = aws_vpc.arun-dev.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "arun-dev-pub-sub-1"
  }
}

resource "aws_subnet" "arun-dev-pub-sub-2" {
  vpc_id                  = aws_vpc.arun-dev.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "arun-dev-pub-sub-2"
  }
}

resource "aws_subnet" "arun-dev-pub-sub-3" {
  vpc_id                  = aws_vpc.arun-dev.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "arun-dev-pub-sub-3"
  }
}

resource "aws_subnet" "arun-dev-pvt-sub-1" {
  vpc_id                  = aws_vpc.arun-dev.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "arun-dev-pvt-sub-1"
  }
}

resource "aws_subnet" "arun-dev-pvt-sub-2" {
  vpc_id                  = aws_vpc.arun-dev.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "arun-dev-pvt-sub-2"
  }
}

resource "aws_subnet" "arun-dev-pvt-sub-3" {
  vpc_id                  = aws_vpc.arun-dev.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "arun-dev-pvt-sub-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "arun-dev-gw" {
  vpc_id = aws_vpc.arun-dev.id

  tags = {
    Name = "arun-dev"
  }
}

# route tables
resource "aws_route_table" "arun-dev-pub-RT" {
  vpc_id = aws_vpc.arun-dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.arun-dev-gw.id
  }

  tags = {
    Name = "arun-dev-pub-RT"
  }
}

# route associations public
resource "aws_route_table_association" "arun-dev-pub-sub-1-a" {
  subnet_id      = aws_subnet.arun-dev-pub-sub-1.id
  route_table_id = aws_route_table.arun-dev-pub-RT.id
}

resource "aws_route_table_association" "arun-dev-pub-sub-2-a" {
  subnet_id      = aws_subnet.arun-dev-pub-sub-2.id
  route_table_id = aws_route_table.arun-dev-pub-RT.id
}

resource "aws_route_table_association" "arun-dev-pub-sub-3-a" {
  subnet_id      = aws_subnet.arun-dev-pub-sub-3.id
  route_table_id = aws_route_table.arun-dev-pub-RT.id
}

