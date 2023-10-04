data "aws_ami" "filter" {
  most_recent = false
  owners      = ["amazon"]

  filter {
    name   = "image-id"
    values = ["ami-067d1e*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.filter.id
  instance_type = "t2.nano"
  count         = 2
  tags = {
    name = "ec2-${count.index + 1}"
  }
}