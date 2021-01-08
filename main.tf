resource "aws_instance" "demo_vm_1" {
  provider                = aws.aws_west
  ami                     = var.ami
  instance_type           = var.type

  tags = {
    name = "Demo VM 1"
  }
}

resource "aws_instance" "demo_vm_2" {
  provider                = aws.aws_west
  ami                     = var.ami
  instance_type           = var.type

  tags = {
    name = "Demo VM 2"
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