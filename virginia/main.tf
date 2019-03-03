module "networking" {
  source          = "../modules/vpc"
  vpc_access_key  = "${var.vir_vpc_access_key}"
  vpc_secret_key  = "${var.vir_vpc_secret_key}"
  vpc_region      = "${var.vir_vpc_region}"
  vpc_tenancy     = "${var.vir_vpc_tenancy}"
  vpc_cidr        = "${var.vir_vpc_cidr}"
  vpc_id          = "${module.networking.vpc_id}"
  subnet_cidr     = "${var.vir_subnet_cidr}"
  subnetname      = "${var.vir_subnetname}"
}
