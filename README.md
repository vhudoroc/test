

A simple PoC using Terraform to create two instances of Amazon AWS EC2 servers running Docker with containerized Nginx daemon. It uses default Amazon AMI PV image for us-east-1.

To check what recurses will be created:

	$ terraform plan

To create EC2 instances and their dependencies:

	$ terraform apply

To destroy all:

	$ terraform destroy
