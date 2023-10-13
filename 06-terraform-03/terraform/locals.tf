locals {
  name     = "netology-${var.vpc_name}-${var.web_variables.web.name}"
  ssh      = file("/home/dev-sso/.ssh/id_ed25519.pub")
  vm_disks = flatten([
    for vm, obj in var.list_vm : [
      for keys, ds in obj.disk : {
        vm_name   = vm
        id        = ds.id
        disk_name = "${ds.disk_name}-${ds.id}"
        disk_size = ds.disk_size
      }
    ]
  ])
  vm_disks_id = flatten([
    for obj in var.list_vm : [
      for ds in obj.disk : {
        id = ds.id
      }
    ]
  ])
  maps = flatten([ for item in local.vm_disks : [
    for elem in item : {
      elem = elem.disk_name
    }]
  ])
}

