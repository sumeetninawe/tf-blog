variable "region_west" {
  default     = "us-west-1"
  description = "AWS West Region"
}

variable "region_east" {
  default     = "us-east-1"
  description = "AWS East Region"
}

variable "ami" {
  default     = "ami-00831fc7c1e3ddc60"
  description = "Amazon Machine Image ID for Ubuntu Server 20.04"
}

variable "type" {
  default     = "t2.micro"
  description = "Size of VM"
}

output "instance_id" {
  //value = aws_instance.demo[*].id
  value = [for b in aws_instance.demo : b.id]
}