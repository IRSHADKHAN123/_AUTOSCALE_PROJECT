provider "aws" {
  region = "ap-south-1"  # Change this if needed
}

resource "aws_instance" "example" {
  ami           = "ami-03c68e52484d7488f"  # Amazon Linux 2 AMI (update based on region)
  instance_type = "t2.micro"               # Free tier eligible

  tags = {
    Name = "ExampleEC2Instance"
  }
}

resource "aws_security_group" "allow_ssh" {
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

resource "aws_instance" "ec2_with_sg" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "EC2WithSecurityGroup"
  }
}
