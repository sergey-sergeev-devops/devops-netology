terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_network" "develop" {
  name = var.name
}

resource "yandex_vpc_subnet" "develop" {
  count          = local.count
  name           = "${var.name}-${count.index}"
  zone           = var.subnets[count.index].zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnets[count.index].cidr
}

locals {
  count = length(var.subnets)
  subnet_ids = [for item in yandex_vpc_subnet.develop : item.id]
}