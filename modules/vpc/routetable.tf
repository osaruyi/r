# Create route table and associate it with the internet gateway
resource "aws_route_table" "rttable" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "${var.rttable_cidr}"
    gateway_id = "${var.igw_id}"
  }

  tags = {
    Name = "dub_rttable"
  }
}

# Assign the route table to all subnets
resource "aws_route_table_association" "rttable" {
  count          = "${length(data.aws_availability_zones.availzone.names)}"
  subnet_id      = "${element(aws_subnet.subnets.*.id, count.index)}"
  route_table_id = "${var.rttable_id}"
}

output "rttable_id" {
  value = "${aws_route_table.rttable.id}"
}
