resource "aws_instance" "jenkinsMaster_ec2" {
  # AMI
  ami = "ami-0e472ba40eb589f49"

  #instance type
  instance_type = "t2.micro"

  # VPC
  subnet_id = aws_subnet.jenkinsMaster_subnet_pub.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.jenkinsMaster_sg.id}"]

  # the aws pem
  key_name               = "default-ec2"


  # jenkins installation
  user_data = file("install_jenkins.sh")

  tags = {
    Name       = "jenkinsMaster_ec2"
    Department = "cloudDevops"
  }
}

