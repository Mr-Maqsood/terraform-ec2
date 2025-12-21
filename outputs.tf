# Outputs
output "public_ip" {
  value = aws_instance.ec2[*].public_ip
}

output "key_name" {
  value = aws_key_pair.default.key_name
}

output "public_dns" {
  value = aws_instance.ec2[*].public_dns
}
output "username" {
  value = var.ec2_username
  
}
