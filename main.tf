provider "aws" {
    region = "us-east-2"
  
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
            }
  }

  backend "s3" {
    bucket = "devopsinfra-2-tf-state"
    key = "platform.tfstate"
    region = "us-east-2"    
  }
}

#to deletecreate resources
resource "aws_instance" "test_server" {
  ami = "ami-0490fddec0cbeb88b"
  instance_type = "t2.micro"
  subnet_id = "subnet-0ecf425ee928af0a7"
  associate_public_ip_address = true
  
}
