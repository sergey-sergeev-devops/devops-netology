resource "yandex_compute_instance" "web_instance" {
  depends_on = [yandex_compute_instance.web]
  for_each = var.list_vm

  name = "${local.name}-${each.value.vm_name}"
  platform_id = var.web_variables.web.platform_id
  zone = var.default_zone

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = var.web_variables.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = local.vm_disks_id
    content {
      disk_id = yandex_compute_disk.disks.product_ids
      auto_delete = true
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-key = local.ssh
    serial-port-enable = 1
  }
}