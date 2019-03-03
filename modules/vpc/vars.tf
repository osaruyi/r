variable "vpc_tenancy"      {}

variable "vpc_cidr"         {}

variable "vpc_region"       {}

variable "vpc_access_key"   {}

variable "vpc_secret_key"   {}

variable "vpc_id"           {}

variable "subnetname"       {}

variable "subnet_cidr" {
  type = "list"
}

# variable "subnet_id"  {
#   type = "list"
# }

#Declare the data source
data "aws_availability_zones" "availzone" {}

variable "igw_id"     {}

# variable "rttable_id" {}

variable "rttable_cidr" {}
