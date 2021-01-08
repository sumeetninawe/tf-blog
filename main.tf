module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1b", "us-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "demo" {
  count                   = length(module.vpc.private_subnets)
  provider                = aws.aws_west
  ami                     = var.ami
  instance_type           = var.type
  vpc_security_group_ids  = [module.vpc.default_security_group_id]
  subnet_id               = tolist(module.vpc.private_subnets)[count.index]

  tags = {
    name = "Demo VM ${count.index}"
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