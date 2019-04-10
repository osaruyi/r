provider "aws" {
  access_key = "${var.vpc_access_key}"
  secret_key = "${var.vpc_secret_key}"
  region     = "${var.vpc_region}"
}

resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnets" {
  count             = "${length(data.aws_availability_zones.availzone.names)}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${element(var.subnet_cidr, count.index)}"
  availability_zone = "${element(data.aws_availability_zones.availzone.names, count.index)}"

  tags = {
    Name = "${var.subnetname}_${count.index+1}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnets.*.id}"
}
