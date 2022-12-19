terraform {
      required_version = "1.3.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.47.0"
    }
  }
}

provider "aws" {
    profile = "default"
    region = "us-east-1"
  # Configuration options
}
resource "aws_instance" "web_server" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
    key_name = "LinuxKeyPair"
    tags = {
        "Name" = "nova-webserver"
        "Department" = "IT"
    }

  
}