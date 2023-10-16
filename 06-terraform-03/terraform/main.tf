resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_disk" "disks" {
  for_each = tomap({
    for id in local.vm_disks : id["disk_name"] => id
  })
  name = each.value["disk_name"]
  size = each.value["disk_size"]
}

data "yandex_compute_image" "ubuntu" {
  family = var.web_variables.web.family
}