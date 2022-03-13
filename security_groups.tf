resource "aws_security_group" "jenkinsMaster_sg" {
  name        = "jenkinsMaster_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.jenkinsMaster_vpc.id

  
  ingress {
    description = "Inbound Rules from VPC"
     from_port        = 0
    to_port          = 0
    protocol         = "-1"
    // This means, all ip address are allowed to ssh ! 
    // Do not do it in the production. 
    // Put your office or home address in it!
    cidr_blocks = ["0.0.0.0/0"]
  }

  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "jenkinsMaster_sg"
    instance_name = "jenkinsMaster_ec2"
  }
}
