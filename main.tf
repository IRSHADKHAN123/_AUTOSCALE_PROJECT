provider "aws" {
  region = "ap-south-1" # Change the region as per your preference
}

resource "aws_instance" "web_server_1" {
  ami           = "ami-03c68e52484d7488f" # Replace with the AMI ID you want to use
  instance_type = "t2.micro" # Change instance type if necessary

  tags = {
    Name = "web-Instance-1"
  }
}

resource "aws_instance" "web_server_2" {
  ami           = "ami-03c68e52484d7488f" # Replace with the AMI ID you want to use
  instance_type = "t2.micro" # Change instance type if necessary

  tags = {
    Name = "web-Instance-2"
  }
}
