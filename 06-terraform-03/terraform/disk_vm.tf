resource "yandex_compute_disk" "disk_vm" {
  count = 3
  size = 1
}

resource "yandex_compute_instance" "storage" {
  name = var.storage_vm.name
  platform_id = var.storage_vm.platform_id
  zone = var.default_zone

  resources {
    cores  = var.storage_vm.cores
    memory = var.storage_vm.memory
    core_fraction = var.storage_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk_vm

    content {
      disk_id = yandex_compute_disk.disk_vm[secondary_disk.key].id
      device_name = yandex_compute_disk.disk_vm[secondary_disk.key].name
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