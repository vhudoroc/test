// Get all subnets for the VPC where the tag 'type=private'
data "aws_subnet_ids" "private" {
  vpc_id = "${var.vpc_id}"
  tags {
    type = "private"
  }
}

// Current Terarform Provider region
data "aws_region" "current" {
  current = true
}

data "aws_vpc" "app_vpc" {
  id = "${var.vpc_id}"
}

// Latest AMI tagged with "Name=${var.app_name}_ami"

// user_data.sh template file
data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.sh")}"
}
