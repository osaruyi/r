# Create a new load balancer
resource "aws_elb" "web_elb" {
  name = "websrvelb"
  # availability_zones = "${element(data.aws_availability_zones.availzone.names, count.index)}"
  subnets         = ["${var.subnet_id}"]
  security_groups = ["${var.secgrp_id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = ["${var.ec2instance}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "websrv_terraform_elb"
  }
}

output "elb_dns" {
  value = "${aws_elb.web_elb.dns_name}"
}
