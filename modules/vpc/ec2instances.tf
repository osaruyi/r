# Generating a new key pair while lauching the instance
resource "aws_key_pair" "dub" {
  key_name   = "dub"
  public_key = "${file("dub.pub")}"
}

#Define webserver inside public subnet
resource "aws_instance" "webserver" {
  count                       = "${length(data.aws_availability_zones.availzone.names)}" #using the count parameter
  ami                         = "${var.ami}"                                             # ami id depending on region
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.dub.key_name}"
  subnet_id                   = "${element(aws_subnet.subnets.*.id, count.index)}"
  vpc_security_group_ids      = ["${aws_security_group.websecgrp.id}"]
  associate_public_ip_address = true
  source_dest_check           = false

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("dub")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "sudo apt update && sudo apt upgrade -y",
      "sudo apt install nginx -y",
      "sleep 30"
    ]
  }

  tags {
    Name = "${var.servername}_${count.index+1}"
  }
}


output "ec2instance" {
  value = "${aws_instance.webserver.*.id}"
}


#Define webserver inside private subnet
# resource "aws_instance" "uyi_dbserver" {
#   count                   = "1" # using the count parameter
#   ami                     = "ami-0b0a60c0a2bd40612" # ami id deoending on region
#   instance_type           = "t2.micro"
#   key_name                = "AWSKEYPAIR"
#   subnet_id               = "${aws_subnet.uyiprisubnet.id}"
#   vpc_security_group_ids  = ["${aws_security_group.uyi_dbsecgrp.id}"]
#   source_dest_check = false
#
#   tags {
#     Name = "uyi_dbserver"
#   }
# }
