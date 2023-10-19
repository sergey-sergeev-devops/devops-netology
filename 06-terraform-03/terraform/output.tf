output "created_vms" {
  value = [
    [
      for item in yandex_compute_instance.web : {
        name = item["name"]
        id   = item["id"]
        fqdn = item["fqdn"]
      }
    ],
    [
      for item in yandex_compute_instance.web_instance : {
        name = item["name"]
        id   = item["id"]
        fqdn = item["fqdn"]
      }
    ],
    [
      {
        name = yandex_compute_instance.storage.name
        id   = yandex_compute_instance.storage.id
        fqdn = yandex_compute_instance.storage.fqdn
      }
    ]
  ]
}