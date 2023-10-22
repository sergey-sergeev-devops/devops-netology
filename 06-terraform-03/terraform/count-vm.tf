resource "yandex_compute_instance" "web" {
  name = "${local.name}-${count.index + 1}"
  platform_id = var.web_variables.web.platform_id
  zone = var.default_zone
  count = 2

  resources {
    cores  = var.web_variables.web.cores
    memory = var.web_variables.web.memory
    core_fraction = var.web_variables.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
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

#  metadata = {
#    ssh-key = "ubuntu:AAAAC3NzaC1lZDI1NTE5AAAAIGX443wu+6htOoxTMSV5dvt6DEMmzElVvn6aYH+4iLhF dev-sso@C-IT-SSO"
#  }
  metadata = var.vms_metadata #{
#    ssh-key = local.ssh
#    ssh-key = var.vms_metadata
#    serial-port-enable = 1
#  }
}