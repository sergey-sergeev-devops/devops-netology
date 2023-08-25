Используем  nano.
При push будут проигнорированы:
Все файлы которые содержаться в папке .terraform/ не смотря на то, где она находится
Все файлы заканчивающиеся на .tfstate и .tfstate.Тут_может_быть_любой_формат
Все файлы crash.log и crash.Тут_могут_быть_любые_символы.log
Все файлы заканчивающиеся на .tfvars and .tfvars.json
Все файлы override.tf and override.tf.json
Все файлы заканчивающиеся на _override.tf and _override.tf.json
Все файлы terraform.rc
Все файлы заканчивающиеся на .terraformrc
