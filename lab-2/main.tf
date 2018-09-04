provider "aws" {
    region = "us-east-1"
}

module "lab-2" {
    source = "./module"
    aws_region = "us-east-1"
    instance_type = "t2.micro"
    ami_id = "ami-759bc50a"
    key_name = "test-key"
    max_capacity = "2"
    min_capacity = "1"
    vpc_id = "xxxxxx"
    desired_capacity = "1"


}

