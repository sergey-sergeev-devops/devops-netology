variable "name" {
  type = string
}

variable "subnets" {
  description = "zone and its subnet"
  type = list(object({
    zone = string,
    cidr = list(string)
  }))
}

#variable "zone" {
#  description = "zone subnet"
#  type = list(string)
#}
#
#variable "v4_cidr_blocks" {
#  description = "ip subnet"
#  type = list(string)
#}