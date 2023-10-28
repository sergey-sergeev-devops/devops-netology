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
  zone      = var.default_zone.0
}

#создаем облачную сеть
#создаем подсеть
module "subnet" {
  source  = "./modules/vpc"
  name    = var.vpc_name
  subnets = [
    { zone = "ru-central1-a", cidr = ["10.77.1.0/24"] },
    { zone = "ru-central1-b", cidr = ["10.77.2.0/24"] },
    { zone = "ru-central1-c", cidr = ["10.77.3.0/24"] },
  ]
}

module "vpc_dev" {
  source  = "./modules/vpc"
  name    = "vpc_dev"
  subnets = [
    { zone = "ru-central1-a", cidr = ["10.77.10.0/24"] },
  ]
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = var.test_vm_name
  network_id      = module.vpc_dev.network_id
  subnet_zones    = var.default_zone
  subnet_ids      = module.vpc_dev.subnet_ids
  instance_name   = var.test_vm_inst_name
  instance_count  = var.test_vm_inst_count
  image_family    = var.image_family
  public_ip       = true

  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }
}

module "mysql-cluster" {
  source = "./modules/mysql_cluster"
  name = "sql"
  network_id = module.vpc_dev.network_id
  subnet_id = module.vpc_dev.subnet_ids.0
  hosts = [{
    zone = "ru-central1-a"
    subnet_id = module.vpc_dev.subnet_ids.0
  }]
#  HA = true
}

module "mysql-db" {
  source = "./modules/mysql_db"
  depends_on = [module.mysql-cluster]
  cluster_id = module.mysql-cluster.cluster_id
  db_name = var.db_name
  db_pass = var.db_pass
}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars     = {
    ssh_key = file(var.ssh_key)
  }
}