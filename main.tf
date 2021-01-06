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
resource "aws_instance" "demo_new" {
  provider      = aws.aws_west
  ami           = "ami-03130878b60947df3"
  instance_type = "t2.micro"
}
*/

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