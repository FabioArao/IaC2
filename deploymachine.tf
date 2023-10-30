terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  profile = "default"
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa-4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-key-pair" {
  key_name = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "tf-key-pair"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-0694d931cee176e7d"
  instance_type = "t2.micro"
  key_name = "tf-key-pair"
  root_block_device {
   volume_size = 9
   volume_type = "gp2"
   }
  vpc_security_group_ids = [
    "sg-05df9ed4864ebd04e",
  ]
  tags = {
    Name = "ubuntu"
  }
}

##resource "aws_ebs_volume" "terraformadded_volume" {
##  availability_zone = "eu-west-1b"
##  size = 5
##  encrypted = false
##  tags = {
##    name = "terraformadded_volume"
##  }
##}
#
output "instance_id" {
  description = "ID of the EC2 instance"
  value = aws_instance.ubuntu.id
}

output "my_public_ip" {
  value = aws_instance.ubuntu.public_ip
}

##resource "aws_volume_attachment" "terraformadded_volume" {
##  device_name = "/dev/xvdg"
##  volume_id = "${aws_ebs_volume.terraformadded_volume.id}"
##  instance_id = "${aws_instance.Centos_server01.id}"
##  skip_destroy = true
##}
#
##resource "aws_eip" "instance_ip" {
##  instance = "${aws_instance.instance.id}"
##  vpc = true
##  associate_with_private_ip = "${aws_instance.instance.private_ip}"
##}
#
#
#
##vpc-0e8c045ddf090fd07
##i-0686a68ca095480c4
##access_key = "AKIAWJVND35EAM66T6W4"
##secret_key = "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"