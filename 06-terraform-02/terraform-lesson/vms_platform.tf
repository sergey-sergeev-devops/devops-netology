

variable "vms_variables" {
  type  = object({
    web   = map(string)
    db    = map(string)
  })
  default = {
    web   = {
      "name"        = "platform-web",
      "platform_id" = "standard-v3"
    }
    db    = {
      "name"        = "platform-db"
      "platform_id" = "standard-v3"
    }
  }
}

variable "vms_resources" {
  type = object({
    web   = map(number)
    db    = map(number)
  })
  default = {
    web   = {
      "vm_web_cores"          = 2,
      "vm_web_memory"         = 1,
      "vm_web_core_fraction"  = 20
    }
    db    = {
      "vm_db_cores"           = 2,
      "vm_db_memory"          = 2,
      "vm_db_core_fraction"   = 20
    }
  }
  description = "variable cores, memory, core fraction for vms"
}