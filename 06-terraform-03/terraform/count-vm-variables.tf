variable "web_variables" {
  type = object({
    web =  map(string)
#    list_vm = map(object({
#      vm_name = string,
#      cpu     = number,
#      ram     = number,
#      disk    = map(map(any))
#    }))
  })
  description = "variables for platform web"
}

variable "list_vm" {
  type = object({
    object({
      vm_name = string,
      cpu     = number,
      ram     = number,
      disk    = map(object({
        disk_name   = string,
        id          = number,
        disk_size   = number
      }))
    })
  })
}

#  default = {
#    web = {
#      "name" = "platform-web",
#      "family" = "ubuntu-2004-lts",
#      "platform_id" = "standard-v3",
#      "cores" = "2",
#      "memory" = "1",
#      "core_fraction" = "20"
#    }
#    list_vm = {
#      main = {
#        vm_name = "main",
#        cpu     = 4,
#        ram     = 2,
#        disk    = {
#          sda = {
#            disk_name = "main-sda",
#            id = yandex_compute_disk.disks.id},
#            disk_size = "10"
#          }
#        }
#      },
#      replica = {
#        vm_name = "replica",
#        cpu     = 2,
#        ram     = 1,
#        disk    = {
#          sda = {
#            disk_name = "replica-sda",
#            id = "2",
#            disk_size = "20"
#          }
#        }
#      }
#    }
#  }

#variable "web_metadata" {
#  type = map(any)
#  default = {
#    "serial-port-enable" = 1
#  }
#}