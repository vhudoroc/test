/* IAM Roles & Policies */
resource "aws_iam_role" "iam_role" {
  name = "lab-2-IamRole"

  description = "Managed by Terraform"
  assume_role_policy = "${file("${path.module}/assume-role-policy.json")}"
}

resource "aws_iam_role_policy" "ec2_policy" {
  role = "${aws_iam_role.iam_role.id}"
  policy = "${data.template_file.inline_policy.rendered}"
}

resource "aws_iam_instance_profile" "iam_profile" {
  name  = "lab-2-IamProfile"
  role = "${aws_iam_role.iam_role.name}"
}

// Data

data "template_file" "inline_policy" {
  template = "${file("${path.module}/inline-policy.json")}"
}
