#create multiple instance with their username and count
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type = number
  default = 2
  
}
variable "ec2_username" {
  description = "Default SSH username for EC2 instance"
  type = string
  default = "ubuntu" 
  
}
variable "key_name" {
    type = string
    default = "Terraform-3rd-key"
  
}
variable "ec2_sg" {
    type = string
    default = "allow_ssh"
    description = "Security group name"
    
}
variable "ssh_port" {
    type = number
    default = 22
    description = "Allow inbound traffic"
  
}
variable "ami" {
    type = string
    default = "ami-0f5fcdfbd140e4ab7"
  
}
variable "instance_type" {
    type = string
    default = "t3.micro"
  
}
variable "tags" {
    type = map(string)
    default = {
      "Name" = "Terraform-EC2"
    }
    
  
}
variable "volume_size" {
    type = number
    default = 20
  
}
variable "volume_type" {
    type = string
    default = "gp3"
  
}