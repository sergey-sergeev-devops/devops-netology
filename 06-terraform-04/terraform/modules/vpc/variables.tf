variable "name" {
  description = "name subnet"
  type = string
}

variable "zone" {
  description = "zone subnet"
  type = string
}

variable "network_id" {
  description = "identification network"
  type = string
}

variable "v4_cidr_blocks" {
  description = "ip subnet"
  type = list(string)
  default = ["10.0.1.0/24"]
}