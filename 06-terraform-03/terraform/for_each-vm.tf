resource "yandex_compute_instance" "web_instance" {
  depends_on = [yandex_compute_instance.web]
  for_each = local.test_vm

  name = "${local.name}-${each.key}"
  platform_id = var.web_variables.web.platform_id
  zone = var.default_zone

  resources {
    cores  = each.value["cpu"]
    memory = each.value["ram"]
    core_fraction = var.web_variables.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = each.value["disk"]
#    for_each = tomap({
#      for id in toset(
#        var.list_vm.disk
#      ) : id["disk_name"] => id
#    })
    content {
      disk_id = yandex_compute_disk.disks[secondary_disk.key].id
      device_name = secondary_disk.key
      auto_delete = true
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = var.vms_metadata #{
#    ssh-key = local.ssh
#    ssh-key = var.vms_metadata
#    serial-port-enable = 1
#  }
}