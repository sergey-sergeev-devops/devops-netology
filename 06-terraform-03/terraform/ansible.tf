resource "local_file" "ansible_cfg" {
  content = templatefile("${path.module}/ansible.tftpl",
    {
      webservers = yandex_compute_instance.web,
      databases = yandex_compute_instance.web_instance,
      storage   = yandex_compute_instance.storage
    })
  filename = "${abspath(path.module)}/ansible.cfg"
}

#resource "local_file" "databases_cfg" {
#  content = templatefile("${path.module}/databases.tftpl", {
#    databases = yandex_compute_instance.web_instance
#  })
#  filename = "${abspath(path.module)}/databases.cfg"
#}

#resource "local_file" "storage_cfg" {
#  content = templatefile("${path.module}/storage.tftpl", {
#    storage   = yandex_compute_instance.storage
#  })
#  filename = "${abspath(path.module)}/storage.cfg"
#}

resource "null_resource" "web_hosts_provision" {
  depends_on = [yandex_compute_instance.web]

  provisioner "local-exec" {
    command = "cat ~/.ssh/id_ed25519 | ssh-add - "
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

#resource "null_resource" "databases_hosts_provision" {
#  depends_on = [yandex_compute_instance.web_instance]
#
#  provisioner "local-exec" {
#    command = "cat ~/.ssh/id_ed25519 | ssh-add - "
#  }
#
#  provisioner "local-exec" {
#    command = "sleep 60"
#  }
#
#  provisioner "local-exec" {
#    command = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/databases.cfg ${abspath(path.module)}/ansible.yml"
#    on_failure = continue
#    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
#  }
#
#  triggers = {
#    always_run         = "${timestamp()}"
#    playbook_src_hash  = file("${abspath(path.module)}/ansible.yml")
#    ssh_public_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGX443wu+6htOoxTMSV5dvt6DEMmzElVvn6aYH+4iLhF dev-sso@C-IT-SSO"
#  }
#}

#resource "null_resource" "storage_hosts_provision" {
#  depends_on = [yandex_compute_instance.web_instance]
#
#  provisioner "local-exec" {
#    command = "cat ~/.ssh/id_ed25519 | ssh-add - "
#  }
#
#  provisioner "local-exec" {
#    command = "sleep 60"
#  }
#
#  provisioner "local-exec" {
#    command = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/storage.cfg ${abspath(path.module)}/ansible.yml"
#    on_failure = continue
#    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
#  }
#
#  triggers = {
#    always_run         = "${timestamp()}"
#    playbook_src_hash  = file("${abspath(path.module)}/ansible.yml")
#    ssh_public_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGX443wu+6htOoxTMSV5dvt6DEMmzElVvn6aYH+4iLhF dev-sso@C-IT-SSO"
#  }
#}