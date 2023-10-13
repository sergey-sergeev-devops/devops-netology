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
    for id in local.vm_disks_id : id.id => id
  })#toset(local.vm_disks_id)
  name = each.key #"${each.value["vm_name"]-${each.value["disk_name"]}}"
  #size = local.vm_disks["disk_size"]
  #disk_id = each.value["id"]

}

data "yandex_compute_image" "ubuntu" {
  family = var.web_variables.web.family
}