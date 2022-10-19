provider "aws" {
 
  region   = "us-west-2"
  profile = "default"
 
}
 
resource "aws_instance" "ubuntu22jammy" {
  ebs_block_device{
      device_name = "/dev/xvdba"
      volume_size = 12
      volume_type = "gp2"
      tags = {
        "FileSystem": "/mnt/var/"
      }
  }
  ebs_block_device{
      device_name = "/dev/xvdbb"
      volume_size = 2
      volume_type = "gp2"
      tags = {
        "FileSystem": "/mnt/var2"
      }

  }

  ami                    = "MYAMIGOESHERE"
  instance_type          = "t2.small"
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./id_ed25519")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /var/tmp/mountup",
      "sudo /var/tmp/mountup",
    ]
  }

}
resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  },
  {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 443
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 443
  }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "MYSSHPUBKEYGOESHERE"
}

