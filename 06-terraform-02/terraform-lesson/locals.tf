locals {
  name_web = "netology-${var.vpc_name}-${var.vms_variables.web.name}"
  name_db = "netology-${var.vpc_name}-${var.vms_variables.db.name}"
}