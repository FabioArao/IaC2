#terraform {
#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#      version = "5.22.0"
#    }
#  }
#}
#
#provider "aws" {
#    region = "eu-west-1"
#    access_key = "AKIAWJVND35EAM66T6W4"
#    secret_key = "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"
#}
#
#resource "aws_instance" "Ubuntu_server" {
#    ami = "ami-0dab0800aa38826f2"
#    instance_type = "t2.micro"
#}
##resource "aws_ebs_volume" "terraformadded_volume" {
##    availability_zone = "eu-west-1b"
##    size = 5
##    encrypted = false
##    tags = {
##        name = "terraformadded_volume"
##    }
##}
#
#