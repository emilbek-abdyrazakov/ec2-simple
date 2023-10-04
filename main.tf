resource "aws_instance" "myec2" {
  ami           = "ami-036f5574583e16426"
  instance_type = "t2.nano"
  count         = 2
  tags = {
    name = "ec2-${count.index + 1}"
  }
}