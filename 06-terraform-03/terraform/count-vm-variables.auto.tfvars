web_variables = {
    web = {
      "name" = "platform-web",
      "family" = "ubuntu-2004-lts",
      "platform_id" = "standard-v3",
      "cores" = "2",
      "memory" = "1",
      "core_fraction" = "20"
    }
#    list_vm = {
#      main = {
#        vm_name = "main",
#        cpu     = 4,
#        ram     = 2,
#        disk    = {
#          sda = {
#            disk_name = "main-sda",
#            id = 1,
#            disk_size = 10
#          }
#          sdb = {
#            disk_name = "main-sdb",
#            id = 2,
#            disk_size = 15
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
#            id = 1,
#            disk_size = 20
#          }
#        }
#      }
#    }
}

list_vm = {
  main = {
    vm_name = "main",
    cpu     = 4,
    ram     = 2,
    disk    = {
      sda = {
        disk_name = "main-sda",
        id = 1,
        disk_size = 10
      }
      sdb = {
        disk_name = "main-sdb",
        id = 2,
        disk_size = 15
      }
    }
  }
  replica = {
    vm_name = "replica",
    cpu     = 2,
    ram     = 1,
    disk    = {
      sda = {
        disk_name = "replica-sda",
        id = 1,
        disk_size = 20
      }
    }
  }
}