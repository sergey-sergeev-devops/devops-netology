output "ip_address_platform" {
  value = {
    instance_name = yandex_compute_instance.platform.network_interface[0].nat_ip_address
  }
}

output "ip_address_platform2" {
  value = {
    instance_name = yandex_compute_instance.platform2.network_interface[0].nat_ip_address
  }
}