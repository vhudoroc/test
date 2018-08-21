variable "aws_region" {
  default = "us-east-1"
}

variable "aws_key_name" {
  default = "test-key"
}

variable "aws_instance_type" {
  default = "t2.micro"
}
variable "aws_instance_user" {
  default = "ubuntu"
}

variable "aws_amis" {
    default = "ami-759bc50a"
}

variable "aws_availability_zones" {
    default = "us-east-1a"

}

