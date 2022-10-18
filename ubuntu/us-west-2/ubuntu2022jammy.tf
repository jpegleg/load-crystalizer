provider "aws" {
 
  region   = "us-west-2"
  profile = "default"
 
}
 
resource "aws_instance" "ubuntu22jammy" {
 
  ami         = "MYAMIGOESHERE"
  instance_type = "t2.small"
 
}
