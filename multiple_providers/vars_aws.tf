variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "instance_type" {default = "t2.micro"}


variable "aws_ami" {
  default = "ami-055fe844b275b02c3"
}

variable "aws_security_group_id" {
  default = "sg-0904a22c77e1aacd4"
}