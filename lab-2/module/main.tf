resource "aws_launch_configuration" "launch_config" {
  name_prefix                 = "lab-2-LaunchConfig"
  image_id                    = ""
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${aws_iam_instance_profile.iam_profile.name}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${aws_security_group.security_group.id}"]
  associate_public_ip_address = "false"
  enable_monitoring           = "false"
  ebs_optimized               = "false"
  user_data                   = "${var.user_data != "" ?  var.user_data : data.template_file.user_data.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elb" "elb" {
  name            = "lab-2-ELB"
  subnets         = ["${data.aws_subnet_ids.private.ids}"]
  security_groups = ["${aws_security_group.elb_sg.id}"]

  listener {
    instance_port     = "80"
    instance_protocol = "TCP"
    lb_port           = "80"
    lb_protocol       = "TCP"
  }

  health_check {
    healthy_threshold   = 3
    interval            = 10
    target              = "HTTP:80/"
    timeout             = 4
    unhealthy_threshold = 3
  }

}
