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

resource "yandex_compute_instance" "dev-01" {
  name        = "${var.vm_name}-01"
  platform_id = var.vm_platform_id

  resources {
    cores  = var.vm_core
    memory = var.vm_memory
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

  metadata = {
    #user-data  = var.metadata_user
    ssh-keys =  var.metadata_ssh
  }
}

resource "yandex_compute_instance" "dev-02" {
  name        = "${var.vm_name}-02"
  platform_id = var.vm_platform_id

  resources {
    cores  = var.vm_core
    memory = var.vm_memory
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

  metadata = {
    #user-data  = var.metadata_user
    ssh-keys =  var.metadata_ssh
  }
}

resource "yandex_compute_instance" "dev-03" {
  name        = "${var.vm_name}-03"
  platform_id = var.vm_platform_id

  resources {
    cores  = var.vm_core
    memory = var.vm_memory
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

  metadata = {
    #user-data  = var.metadata_user
    ssh-keys =  var.metadata_ssh
  }
}
