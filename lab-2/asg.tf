resource "aws_autoscaling_group" "asg" {
  lifecycle {
    create_before_destroy = true
    ignore_changes = ["desired_capacity", "max_size", "min_size"]
  }
  name                      = "lab-2"
  max_size                  = "${var.max_capacity}"
  min_size                  = "${var.min_capacity}"
  desired_capacity          = "${var.desired_capacity}"
  launch_configuration      = "${aws_launch_configuration.launch_config.name}"
  default_cooldown          = "${var.default_cooldown}"
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "ELB"
  load_balancers = ["${aws_elb.elb.name}"]
  vpc_zone_identifier       = ["${data.aws_subnet_ids.private.ids}"]
  termination_policies      = ["OldestLaunchConfiguration", "OldestInstance", "Default"]
  enabled_metrics           = ["GroupTotalInstances", "GroupPendingInstances", "GroupTerminatingInstances",
    "GroupMaxSize", "GroupMinSize", "GroupStandbyInstances", "GroupInServiceInstances",
    "GroupDesiredCapacity"]

  tag = [

    {
      key = "Name"
      value = "lab-2"
      propagate_at_launch = true
    }
  ]

}
