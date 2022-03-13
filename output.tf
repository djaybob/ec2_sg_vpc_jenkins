output "jenkinsMaster_ec2_public_dns" {
  value = aws_instance.jenkinsMaster_ec2.public_dns
}
output "jenkinsMaster_ec2_public_ip" {
  value = aws_instance.jenkinsMaster_ec2.public_ip
}
output "jenkinsMaster_ec2_ssh_command" {
  value = "ssh -i /root/aws/aws_keys/default-ec2.pem ubuntu@${aws_instance.jenkinsMaster_ec2.public_dns}"
}


