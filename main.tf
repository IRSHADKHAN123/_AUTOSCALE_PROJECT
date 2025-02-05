provider "aws" {
  region = "ap-south-1" # Change as per your region
}

# Define the key pair (Ensure the key exists in AWS)
resource "aws_key_pair" "my_key" {
  key_name   = "my-terraform-key"  # Change this to your key name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with your public key path
}

# First EC2 instance
resource "aws_instance" "web_server_1" {
  ami           = "ami-03c68e52484d7488f" # Replace with correct AMI ID
  instance_type = "t2.micro" # Change instance type if needed
  key_name      = aws_key_pair.my_key.key_name  # Attach the key pair

  tags = {
    Name = "web-Instance-1"
  }
}

# Second EC2 instance
resource "aws_instance" "web_server_2" {
  ami           = "ami-03c68e52484d7488f" # Replace with correct AMI ID
  instance_type = "t2.micro" # Change instance type if needed
  key_name      = aws_key_pair.my_key.key_name  # Attach the key pair

  tags = {
    Name = "web-Instance-2"
  }
}

