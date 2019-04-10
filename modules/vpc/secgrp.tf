#Define security group for public subnet
resource "aws_security_group" "websecgrp" {
  name        = "mod_websecgrp"
  description = "Allow incoming HTTP connection & SSH access"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserversg"
  }
}

output "secgrp_id" {
  value = "${aws_security_group.websecgrp.id}"
}

#Define security group for private subnet
# resource "aws_security_group" "uyi_dbsecgrp" {
#   name        = "uyi_dbsecgrp"
#   description = "Allow traffic from public subnet"
#   vpc_id      = "${aws_vpc.terra_vpc.id}"
#
#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["10.0.1.0/24"]
#   }
#
#   ingress {
#     from_port       = -1
#     to_port         = -1
#     protocol        = "icmp"
#     cidr_blocks     = ["10.0.1.0/24"]
#   }
#
#   ingress {
#     from_port       = 22
#     to_port         = 22
#     protocol        = "tcp"
#     cidr_blocks     = ["10.0.1.0/24"]
#   }
#
#   tags = {
#     Name = "db server sg"
#   }
# }
