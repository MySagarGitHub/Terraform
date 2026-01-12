output "instance_public_ip" {
  value       = aws_instance.my_ec2.public_ip
  sensitive   = true
  description = "The public IP address of the EC2 instance"
}
