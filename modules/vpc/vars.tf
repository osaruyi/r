# Modules variables

variable "vpc_tenancy" {}

variable "vpc_cidr" {}

variable "vpc_region" {}

variable "vpc_access_key" {}

variable "vpc_secret_key" {}

variable "vpc_id" {}

variable "subnetname" {}

variable "subnet_cidr" {
  type = "list"
}

variable "subnet_id" {
  type = "list"
}

#Declare the data source
data "aws_availability_zones" "availzone" {}

variable "igw_id" {}

variable "rttable_id" {}

variable "rttable_cidr" {}

variable "ami" {}

variable "servername" {}

variable "secgrp_id" {}

variable "elb_dns" {}

variable "ec2instance" {
  type = "list"
}




# variable "ami" {
#   type = "map"
#
#   default = {
#     eu-west-1 = "ami-08d658f84a6d84a80"
#     us-east-1 = "ami-0a313d6098716f372"
#   }
# }
