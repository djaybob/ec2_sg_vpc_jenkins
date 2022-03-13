resource "aws_internet_gateway" "jenkinsMaster_ig" {
  vpc_id = aws_vpc.jenkinsMaster_vpc.id
  tags = {
    Name = "jenkinsMaster_ig"
  }
}

resource "aws_route_table" "jenkinsMaster_rt_pub_cert" {
  vpc_id = aws_vpc.jenkinsMaster_vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.jenkinsMaster_ig.id
  }

  tags = {
    Name = "jenkinsMaster_rt_pub_cert"
  }
}

resource "aws_route_table_association" "jenkinsMaster_crtassoc_pub_subnet_1" {
  subnet_id      = aws_subnet.jenkinsMaster_subnet_pub.id
  route_table_id = aws_route_table.jenkinsMaster_rt_pub_cert.id
}

