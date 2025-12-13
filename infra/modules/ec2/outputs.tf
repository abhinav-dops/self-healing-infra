output "public_ip" {
  value = aws_instance.app.ec2.public_ip
}