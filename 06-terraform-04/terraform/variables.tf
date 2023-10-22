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

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.77.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "web-net"
  description = "VPC network&subnet name"
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