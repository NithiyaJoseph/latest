provider "aws"{
region="us-east-1"
}
resource "aws_instance" "my-instance" {
  ami=lookup(var.ami,var.name)
  instance_type = "t2.micro"
  count=1
  key_name = "nits"

  tags = {
   Name=var.name
  }
}
variable "ami" {
  type=map
   default={
        "Linux"="ami-08e4e35cccc6189f4"
        "Windows"="ami-0d43d465e2051057f"
        }
}
variable "name" {
  default="Linux"
}
