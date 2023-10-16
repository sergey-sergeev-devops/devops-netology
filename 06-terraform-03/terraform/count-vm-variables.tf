variable "web_variables" {
  description = "variables for platform web"
  type = object({
    web =  map(string)
  })

  default = {
    web = {
      "name"          = "platform-web",
      "family"        = "ubuntu-2004-lts",
      "platform_id"   = "standard-v3",
      "cores"         = "2",
      "memory"        = "1",
      "core_fraction" = "20"
    }
  }
}

variable "storage_vm" {
  description = "setting variables for the storage vm"
  type = map(string)
  default = {
    "name"          = "platform-storage",
    "family"        = "ubuntu-2004-lts",
    "platform_id"   = "standard-v3",
    "cores"         = "2",
    "memory"        = "1",
    "core_fraction" = "20"
  }
}

variable "vms_metadata" {
  type = map(any)
}

variable "list_vm" {
  description = "setting variables for the vm, will be created after web_variables"
  type = list(object({
    vm_name = string,
    cpu     = number,
    ram     = number,
    disk    = list(object({
      disk_name   = string
      disk_size   = number
      disk_id     = number
    }))
  }))

  default = [
    {
      vm_name = "main",
      cpu     = 2,
      ram     = 2,
      disk    = [
        {
          disk_name = "sda"
          disk_size = 10
          disk_id   = 1
        },
        {
          disk_name = "sdb"
          disk_size = 15
          disk_id   = 2
        }
      ]
    },
    {
      vm_name = "replica",
      cpu     = 2,
      ram     = 2,
      disk    = [
        {
          disk_name = "sda"
          disk_size = 20
          disk_id   = 1
        }
      ]
    }
  ]
}