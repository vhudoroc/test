
variable "ami_id" {
  default = ""
}
variable "instance_type" {}
variable "key_name" {}
variable "user_data" {
  default = ""
}
variable "vpc_id" {}
variable "max_capacity" {}
variable "min_capacity" {}
variable "desired_capacity" {}
variable "logging_level" {
  default = "info"
}
variable "default_cooldown"{
  default = 1200
}

variable "health_check_grace_period" {
  default = 150
}

variable "scaleup_morning_schedule" {
  default = "0 12 * * *"
}

variable "scaledown_nightly_schedule" {
  default = "0 6 * * *"
}

variable "disable_scheduled_scaling" {
  description = "if true, do not scale down to 0 in the evening and backup in the morning"
  type = "string"
  default = "false"
}
variable "overwrite" {
  default = "true"
}
variable "aws_region" {
  default = ""
}
