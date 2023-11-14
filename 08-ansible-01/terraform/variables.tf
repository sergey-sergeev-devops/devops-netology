variable "token" {
  type = string
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type = string
  default = "ru-central1-a"
}

variable "vpc_name" {
  type = string
  default = "dev-network"
}

variable "default_cidr" {
  type = list(string)
  default = ["10.77.1.0/24"]
}

variable "vm_name" {
  type = string
  default = "dev-ubuntu"
}

variable "vm_platform_id" {
  type = string
  default = "standard-v1"
}

variable "vm_core" {
  type = number
  default = 2
}

variable "vm_memory" {
  type = number
  default = 2
}

variable "vm_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "metadata_user" {
  type = string
}

variable "metadata_ssh" {
  type = string
}