terraform{

}
provider "vault" {
    address = "http://127.0.0.1:8200"
    skip_tls_verify = true
    token = "education"
        # checkov:skip=CKV_SECRET_6: education
}

data "vault_generic_secret" "vault_example"{
 path = "secret/example"
}
output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data.1)}" #функция nonsensitive позволяет узнать значение sensitive данных
}