provider "aws" {
 
  region   = "us-west-2"
  profile = "default"
 
}
 
resource "aws_instance" "ubuntu22jammy" {
 
  ami         = "ami-0a22ed271d3dbf544"
  instance_type = "t2.small"
 
}
