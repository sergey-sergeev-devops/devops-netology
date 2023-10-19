locals {
  name     = "netology-${var.vpc_name}-${var.web_variables.web.name}"
  ssh      = file("/home/dev-sso/.ssh/id_ed25519.pub")

  vm_disks = flatten([
    for obj in var.list_vm : [
      for ds in obj.disk : {
        disk_name = "${obj.vm_name}-${ds.disk_name}"
        disk_size = ds.disk_size
      }
    ]
  ])

  test = tomap({
    for id in local.vm_disks : id["disk_name"] => id
  })

  test_vm = tomap({
    for list in flatten([
      for item in var.list_vm : {
        vm_name = item.vm_name
        cpu     = item.cpu
        ram     = item.ram
        disk    = {
          for elem in flatten([
            for res in item.disk : {
              disk_name = "${item.vm_name}-${res.disk_name}"
              disk_size = res.disk_size
              disk_id   = res.disk_id
            }
          ]) : elem["disk_name"] => elem
        }
      }
    ]) : list["vm_name"] => list
  })

  list_vm = tomap({
    for item in flatten([
      for obj in var.list_vm : {
        vm_name = obj.vm_name,
        cpu     = obj.cpu,
        ram     = obj.ram
      }
    ]) : item["vm_name"]  => item
  })
}