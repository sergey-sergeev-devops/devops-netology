###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "subnets" {
  description = "zone and its subnet"
  type = list(map(string))
  default = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
  ]
}

variable "default_zone" {
  type        = list(string)
  default     = ["ru-central1-a"]
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

#variable "default_cidr" {
#  type        = list(string)
#  default     = ["10.77.1.0/24", "10.77.2.0/24", "10.77.3.0/24"]
#  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
#}

variable "vpc_name" {
  type        = string
  default     = "web-product"
  description = "VPC network&subnet name"
}

variable "db_name" {
  type = string
}

variable "db_pass" {
  type = string
}

variable "test_vm_name" {
  type    = string
  default = "develop"
}

variable "test_vm_inst_name" {
  type = string
  default = "web"
}

variable "test_vm_inst_count" {
  type = number
  default = 2
}

variable "ssh_key" {
  type    = string
  default = ""
}

variable "image_family" {
  type = string
  default = "ubuntu-2004-lts"
}