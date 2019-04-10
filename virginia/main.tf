module "networking" {
  source         = "../modules/vpc"
  vpc_access_key = "${var.vir_vpc_access_key}"
  vpc_secret_key = "${var._vpc_secret_key}"
  vpc_region     = "${var.vir_vpc_region}"
  vpc_tenancy    = "${var.vir_vpc_tenancy}"
  vpc_cidr       = "${var.vir_vpc_cidr}"
  vpc_id         = "${module.networking.vpc_id}"
  subnet_cidr    = "${var.vir_subnet_cidr}"
  subnetname     = "${var.vir_subnetname}"
  subnet_id      = "${module.networking.subnet_id}"
  igw_id         = "${module.networking.igw_id}"
  rttable_id     = "${module.networking.rttable_id}"
  rttable_cidr   = "${var.vir_rttable_cidr}"
  ami            = "${var.vir_ami}"
  secgrp_id      = "${module.networking.secgrp_id}"
  servername     = "${var.vir_servername}"

}
