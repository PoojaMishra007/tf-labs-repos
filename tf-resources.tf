resource "aws_instance" "app_server" {
  ami = var.appserver_imageid
  instance_type = var.appserver_instance_type
  key_name = "LinuxKeyPair"
  security_groups = [ aws_security_group.allow_ssh_sg ]
  vpc_security_group_ids = [ aws_security_group.allow_ssh_sg ]
  
 
  }


resource "aws_security_group" "allow_ssh_sg" {
    name   = "Pooja_allow_ssh_sg"
    description = "Allow ssh inbound traffic"


    ingress  {
      
      description  = "Allow SSH"
      from_port    = 22
      protocol     = "tcp"
      to_port      = 22
      cidr_blocks  = ["0.0.0.0/0"]
    } 

    egress  {

    
      from_port = 0
      protocol  = "-1"
      to_port   = 0
      cidr_blocks   = ["0.0.0.0/0"]
    }
    
}