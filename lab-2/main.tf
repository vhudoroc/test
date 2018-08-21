provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_security_group" "default" {
    name = "terraform_security_group"
    description = "AWS security group for terraform example"
    ingress {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags {
        Name = "Terraform AWS security group"
    }
}

resource "aws_elb" "web" {
    name = "terraform"

    listener {
        instance_port       = 80
        instance_protocol   = "http"
        lb_port             = 80
        lb_protocol         = "http"
    }

    availability_zones = [
        "${aws_instance.web.*.availability_zone}"
    ]

    instances = [
        "${aws_instance.web.*.id}"
    ]
}

resource "aws_instance" "web" {
    instance_type = "${var.aws_instance_type}"
    ami = "${var.aws_amis}"
    availability_zone = "${var.aws_availability_zones}"

    key_name = "${var.aws_key_name}"
    security_groups = [ "${aws_security_group.default.*.name}" ]
    associate_public_ip_address = true

    connection {
        user = "${var.aws_instance_user}"
    }

    provisioner "file" {
        source = "files/"
        destination = "/tmp/"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install -y docker",
            "sudo service docker start",
            "sudo docker pull nginx",
            "sudo docker run -d -p 80:80 -v /tmp:/usr/share/nginx/html --name nginx nginx",
            "sudo sed -iE \"s/{{ hostname }}/`hostname`/g\" /tmp/index.html",
            "sudo sed -iE \"s/{{ container_name }}/nginx/g\" /tmp/index.html"
        ]
    }

}
