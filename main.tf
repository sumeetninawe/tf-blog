data "aws_ami" "myAmi" {
  owners = ["099720109477"]
  most_recent      = true

  filter {
    name = "description"
    values = ["Canonical, Ubuntu, 20.04 LTS*"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter {
    name = "image-type"
    values = ["machine"]
  }

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20201026"]
  }
}

resource "aws_instance" "demo_vm_1" {
  provider                = aws.aws_west
  ami                     = data.aws_ami.myAmi.id
  instance_type           = var.type

  tags = {
    name = "Demo VM 1"
  }
}

resource "aws_instance" "demo_vm_2" {
  provider                = aws.aws_west
  ami                     = data.aws_ami.myAmi.id
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