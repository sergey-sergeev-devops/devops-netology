variable "name" {
  description = "cluster name"
  type = string
}

variable "network_id" {
  type = string
}

variable "environment" {
  type = string
  default = "PRESTABLE"
}

variable "ver" {
  type = string
  default = "8.0"
}

variable "subnet_id" {
  type = string
}

variable "HA" {
  description = ""
  type = bool
  default = false
}

variable "hosts" {
  type = list(object({
    zone = string
    subnet_id = string
  }))
}