resource "aws_ebs_volume" "extra_volume" {
  availability_zone = "eu-west-1b"
  size = 20
  encrypted = false
  tags = {
    name = "extra_volume"
  }
}
resource "aws_volume_attachment" "extra_volume" {
    device_name  = "/dev/xvdf"
    instance_id = "${aws_instance.ubuntu.id}"
    volume_id = "${aws_ebs_volume.extra_volume.id}"
    skip_destroy = true
}