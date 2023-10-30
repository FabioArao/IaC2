
resource "null_resource" "remote" {
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("tf-key-pair")  # Provide the path to your private key file
    host        = aws_instance.ubuntu.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-add-repository -y ppa:ansible/ansible",
      "sudo apt-get update",
      "sudo apt-get install -y ansible",
      "ansible --version"
    ]
  }
}

#aws_instance.Ubuntu_server01