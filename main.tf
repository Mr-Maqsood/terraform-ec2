# Provider Configuration
provider "aws" {
  region = "us-east-2"
}

# Create SSH key pair
resource "aws_key_pair" "default" {
  key_name   = "terraform-key"
  public_key = file("/home/codespace/.ssh/id_rsa.pub")
}

# Create a Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instance
resource "aws_instance" "ec2" {
  ami                    = "ami-0f5fcdfbd140e4ab7"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.default.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "First-terraform-instance"
  }
}

# Outputs
output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "key_name" {
  value = aws_key_pair.default.key_name
}

output "public_dns" {
  value = aws_instance.ec2.public_dns
}

