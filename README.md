# Project contains 2 folders, one for Docker and another for Terraform. Lab folder cntains simple Docker exercise: 
Dockerfile which uses the official ruby image (https://hub.docker.com/_/ruby/) which
contains a ruby program running in an infinite loop and doing the following:
Program
1. Do a 5sec pause.
2. Downloads the JSON file exercise1.yaml
3. Generates terraform resources “aws_instance” (https://www.terraform.io/docs/providers/
aws/r/instance.html) and “aws_key_pair” (https://www.terraform.io/docs/providers/aws/r/
key_pair.html) out of it. The key needs to be used by the instance.
4. Prints out the terraform resources.

In order to use it:
- Create Docker image from Dockerfile: 
cd lab; 
docker build -t test .; 
docker run -dt test"

# Lab-2 folder contains a Terraform exercise:
A terraform configuration which contains the following:
AWS Setup
• An EC2 instance of type t2.micro based on a Ubuntu image.
• A Loadbalancer forwarding incoming requests to the EC2 instance.
The EC2 instance needs to run an Nginx webserver serving one HTML file (just make one up and
make the file part of your Github repo). The Nginx server is a Docker container started on the EC2
instance.
The state can be deployed by: terraform init and terraform apply.

These projects require AWS permissions to create ressources. 
