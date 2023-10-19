resource "local_file" "ansible_cfg" {
  content = templatefile("${path.module}/ansible.tftpl",
    {
      webservers = yandex_compute_instance.web,
      databases = yandex_compute_instance.web_instance,
      storage   = yandex_compute_instance.storage
    })
  filename = "${abspath(path.module)}/ansible.cfg"
}

resource "null_resource" "web_hosts_provision" {
  depends_on = [yandex_compute_instance.web]

  provisioner "local-exec" {
    command = "eval $(ssh-agent) && ssh-add"
  }

  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "local-exec" {
    command     = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/ansible.cfg ${abspath(path.module)}/ansible.yml"
    on_failure  = continue
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  }

  triggers = {
    always_run         = "${timestamp()}"
    playbook_src_hash  = file("${abspath(path.module)}/ansible.yml")
    ssh_public_key     = local.ssh
  }
}