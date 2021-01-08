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

output "instance_id_1" {
  value = aws_instance.demo_vm_1.id
}

output "instance_id_2" {
  value = aws_instance.demo_vm_2.id
}