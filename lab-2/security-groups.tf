resource aws_security_group security_group {
  name = "lab-2-SecurityGroup"
  vpc_id = "${var.vpc_id}"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    //    description = "allow ssh from hosts in vpc and allow ssh from bastion hosts"
    from_port = 22
    to_port = 22
    cidr_blocks = ["${data.aws_vpc.app_vpc.cidr_block}"]
    protocol = "TCP"
  }

  ingress {
    from_port = 80
    to_port = 80
    cidr_blocks = ["${data.aws_vpc.app_vpc.cidr_block}"]
    protocol = "TCP"
  }
}

resource aws_security_group elb_sg {
  name_prefix = "lab-2-ELB-SecurityGroup"
  vpc_id = "${var.vpc_id}"
  description = "Load Balancer Security Group - Managed by Terraform"

  egress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
