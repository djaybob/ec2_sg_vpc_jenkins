resource "aws_vpc" "jenkinsMaster_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name = "jenkinsMaster_vpc"
  }
}

resource "aws_subnet" "jenkinsMaster_subnet_pub" {
  vpc_id                  = aws_vpc.jenkinsMaster_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "us-east-1a"
  tags = {
    Name = "jenkinsMaster_subnet_pub"
  }
}