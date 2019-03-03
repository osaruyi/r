resource "aws_route_table" "rttable" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "${var.rttable_cidr}"
    gateway_id = "${var.igw_id}"
  }

  tags   = {
    Name = "rttable"
  }
}

# Assign the route table to the public subnet
#   resource "aws_route_table_association" "rttable" {
#   subnet_id      = "${var.subnet_id}"
#   route_table_id = "${var.rttable_id}"
# }
#
# output "rttable_id" {
#   value = "aws_route_table.rttable.id"
# }
