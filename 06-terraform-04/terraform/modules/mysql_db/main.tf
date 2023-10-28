terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_mdb_mysql_database" "my-db" {
  cluster_id = var.cluster_id.0
  name = var.name
#  depends_on = [mysql-cluster]
}

resource "yandex_mdb_mysql_user" "db_user" {
  cluster_id = var.cluster_id.0
  name = var.db_name
  password = var.db_pass

  permission {
      database_name = yandex_mdb_mysql_database.my-db.name
      roles         = ["ALL"]
    }
}