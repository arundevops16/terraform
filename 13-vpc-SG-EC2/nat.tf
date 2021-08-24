# nat gw
resource "aws_eip" "arun-dev-nat" {
  vpc = true
}

resource "aws_nat_gateway" "arun-dev-nat-gw" {
  allocation_id = aws_eip.arun-dev-nat.id
  subnet_id     = aws_subnet.arun-dev-pub-sub-1.id
  depends_on    = [aws_internet_gateway.arun-dev-gw]
}

# VPC setup for NAT
resource "aws_route_table" "arun-dev-pvt-RT" {
  vpc_id = aws_vpc.arun-dev.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.arun-dev-nat-gw.id
  }

  tags = {
    Name = "arun-dev-pvt-RT"
  }
}

# route associations private
resource "aws_route_table_association" "arun-dev-pvt-sub-1-a" {
  subnet_id      = aws_subnet.arun-dev-pvt-sub-1.id
  route_table_id = aws_route_table.arun-dev-pvt-RT.id
}

resource "aws_route_table_association" "arun-dev-pvt-sub-2-a" {
  subnet_id      = aws_subnet.arun-dev-pvt-sub-2.id
  route_table_id = aws_route_table.arun-dev-pvt-RT.id
}

resource "aws_route_table_association" "arun-dev-pvt-sub-3-a" {
  subnet_id      = aws_subnet.arun-dev-pvt-sub-3.id
  route_table_id = aws_route_table.arun-dev-pvt-RT.id
}

