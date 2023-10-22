terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.name
  zone           = var.zone
  network_id     = var.network_id
  v4_cidr_blocks = var.v4_cidr_blocks
}