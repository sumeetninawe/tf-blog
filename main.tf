//Using for_each meta-argument

resource "aws_instance" "demo" {
  for_each = {
      fruit = "apple"
      vehicle = "car"
      continent = "Europe"
  }
  provider      = aws.aws_west
  ami           = var.ami
  instance_type = var.type

  tags = {
    name = "${each.key}: ${each.value}"
  }
}

/*
Using count meta-argument

resource "aws_instance" "demo" {
  count         = 3
  provider      = aws.aws_west
  ami           = var.ami
  instance_type = var.type

  tags = {
    name = "Demo System"
  }
}
*/