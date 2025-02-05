provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA34AMCVVNQJ44ZYWI"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0d13e3e640877b0b9"
    instance_type = "t2.micro"
    
    tags = {
        Name = "ec2-instance"
    }
} 
