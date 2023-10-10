resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.name_web
  platform_id = var.vms_variables.web.platform_id
  resources {
    cores         = var.vms_resources.web.vm_web_cores
    memory        = var.vms_resources.web.vm_web_memory
    core_fraction = var.vms_resources.web.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = var.vms_metadata
#  metadata = {
#    serial-port-enable = var.vms_shared_variables.serial-port-enable
#    ssh-keys           = "ubuntu:${var.vms_shared_variables.ssh-keys}"
#  }
}

resource "yandex_compute_instance" "platform2" {
    name        = local.name_db
    platform_id = var.vms_variables.db.platform_id
    resources {
      cores         = var.vms_resources.db.vm_db_cores
      memory        = var.vms_resources.db.vm_db_memory
      core_fraction = var.vms_resources.db.vm_db_core_fraction
    }
    boot_disk {
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
      }
    }
    scheduling_policy {
      preemptible = true
    }
    network_interface {
      subnet_id = yandex_vpc_subnet.develop.id
      nat       = true
    }

    metadata = var.vms_metadata
}

