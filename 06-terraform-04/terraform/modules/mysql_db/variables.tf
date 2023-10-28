variable "name" {
  type = string
  default = "test_db"
}

variable "cluster_id" {
  type = list(string)
}

variable "db_name" {
  type = string
}

variable "db_pass" {
  type = string
}