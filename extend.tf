resource "null_resource" "extend" {
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("tf-key-pair")  # Provide the path to your private key file
    host        = aws_instance.ubuntu.public_ip
  }

  provisioner "remote-exec" {
    inline = [
        "sudo lvextend -l +100%FREE /dev/mapper/vgdemo-lvdata1",
        "lvs"
    ]
  }
}