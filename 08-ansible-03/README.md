### Ansible roles для установки и базовой настройки Lighthouse, Vector, Clickhouse

### Содержание

### Поддерживаемые платформы
```
* Centos
```

### Зависимости

* Nginx
* Git

### Переменные

| Name                              | Default Value                                                  | Description            |
|-----------------------------------|----------------------------------------------------------------|------------------------|
| `lighthouse_worker_processes`     | auto                                                           | Рабочие процессы       |
| `lighthouse_worker_connections`   | lighthouse                                                     | Количество подключений |
| `lighthouse_client_max_body_size` | 512M                                                           |                        |
| `nginx_user`                      | nginx                                                          |                        | 
| `clickhouse_version`              | 22.3.3.44                                                      | Версия Clickhouse      |
| `clickhouse_packages`             | clickhouse-client, clickhouse-server, clickhouse-common-static | Устанавливаемые пакеты |

### Пример использования

1. Скачать roles с git - https://github.com/sergey-sergeev-devops/devops-netology/tree/main/08-ansible-03
2. Можно использовать terraform: в папке terraform подготовлены файлы для создания ВМ - нужно заполнить значения для переменных (для этого лучше всего создать файл `personal.auto.tfvars`): 
    - token
    - cloud_id
    - folder_id
    - default_zone
    - metadata_ssh
3. После создания ВМ (при использовании `terraform`) нужно прописать `ip` серверов в файле `./inventory/prod.yml`. Пример:
```
    - clickhouse_servers:
        hosts:
            clickhouse:
              ansible_host: 158.160.110.123
              ansible_user: centos
              ansible_ssh_private_key_file: /home/dev-sso/.ssh/id_ed25519
```
4. Переходим в папку `playbook` командой `cd`
5. Выполняем команду: 
    - `ansible-playbook -i ./inventory/prod.yml site.yml`