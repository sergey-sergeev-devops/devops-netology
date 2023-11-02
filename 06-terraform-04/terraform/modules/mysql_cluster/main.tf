terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_mdb_mysql_cluster" "mysql-cluster" {
  environment = var.environment
  name        = var.name
  network_id  = var.network_id
  version     = var.ver

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-ssd"
    disk_size          = 16
  }

  dynamic "host" {
    for_each = local.hosts
    content {
      zone      = host.value["zone"]
      subnet_id = var.subnet_id
    }
  }
}

locals {
  hosts = "${var.HA == true ? var.hosts : [{
        zone      = "ru-central1-a"
        subnet_id = var.subnet_id
  }]}"
  cluster_ids = [yandex_mdb_mysql_cluster.mysql-cluster.id]                #[for item in yandex_mdb_mysql_cluster.mysql-cluster : item["id"]]
}