terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}



#создаем облачную сеть
module "network" {
  source = "./modules/network"
  name = var.vpc_name
}

#создаем подсеть
module "subnet" {
  source = "./modules/vpc"
  name = var.vpc_name
  zone = var.default_zone
  network_id = module.network.network_id
  v4_cidr_blocks = [var.default_cidr]
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = var.test_vm_name
  network_id      = module.network.network_id
  subnet_zones    = var.default_zone
  subnet_ids      = module.subnet.subnet_id
  instance_name   = var.test_vm_inst_name
  instance_count  = var.test_vm_inst_count
  image_family    = var.image_family
  public_ip       = true

  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars     = {
    ssh_key = file(var.ssh_key)
  }
}