terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "terraform-demo"
  region  = "us-east-1"
  default_tags {
    tags = {
      ManagedBy = "terraform"
    }
  }
}

resource "aws_instance" "app_server" {
  #ami           = "ami-830c94e3"
  #ami           = "ami-0e472ba40eb589f49" #1 - Change to "ami-0e472ba40eb589f49"
  ami           = "ami-04505e74c0741db8d" #2 - Change to "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  #instance_type = var.instance_type #6 - Read the value from the variable
  vpc_security_group_ids = [ aws_security_group.allow_web_traffic.id ]

  tags = {
    Name = "dummy-server"
    #Name = var.instance_name #5 - Read the value from the variable
  }
}
# ============================================================================
# 3 - ADDING SECURITY GROUP
# ============================================================================
resource "aws_security_group" "allow_web_traffic" {
  name        = "allow_web_traffic"
  description = "Allow HTTP/HTTPS traffic from anywhere"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    description = "Allows HTTP traffic from anywhere"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    description = "Allows HTTPS traffic from anywhere"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # 4 - Add this ingress rule temporarily to ping the ec2 instance
  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"
    description = "Allows ICMP traffic from anywhere"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_web_traffic"
  }
}
