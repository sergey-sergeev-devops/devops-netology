terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = ""
  cloud_id = "b1g3lenih1do9e4cobh0"
  folder_id = var.folder_id
  zone = var.zone
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

resource "yandex_compute_instance" "node01" {
  name = "node01"
  hostname = "node01"
  description = "node01"
  folder_id = var.folder_id
  zone = var.zone
  platform_id = "standard-v2"

  allow_stopping_for_update = true

  resources {
    cores  = 2
    core_fraction = 100
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8il24jjf1hg8d4nq7i"
      size = 30
      type = "network-ssd"
    }
  }

  network_interface {
    subnet_id = "e9bpfuhif2pvffbvvf5i"
    nat = true
  }
}

variable "folder_id" {
  type = string
  default = "b1gp7gb4o7baqef6kc0u"
}

variable "zone" {
  type = string
  default = "ru-central1-a"
}