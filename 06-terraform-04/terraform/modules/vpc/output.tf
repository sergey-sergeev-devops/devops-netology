output "subnet_ids" {
  value = local.subnet_ids
}

output "network_id" {
  value = yandex_vpc_network.develop.id
}
