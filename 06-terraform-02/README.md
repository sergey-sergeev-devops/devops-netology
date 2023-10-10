### ***Задание 1***

 - ![terraform-cloud-vm](./src/terraform-cloud-vm.png)
 - ![terraform-ssh-cloud-vm](./src/terraform-ssh-cloud-vm.png)
 - Ответы на вопросы:
    - ``preemptible = true`` -- делает ВМ прерываемой, это может поспособствовать снижению затрат на использование ВМ, поскольку в неактивном состоянии денежных средств расходуется меньше.
    - ``core_fraction=5`` -- насколько я понял, задает процент использования CPU, что так же ограничивает расход ДС на аккаунте.

### ***Задание 2***

- ![terraform-variables-check-plan](./src/terraform-variables-check-plan.png)
- [---> main.tf](./terraform-lesson/main.tf)
- 

### ***Задание 3***

- ![terraform-platform2-created](./src/terraform-platform2-created.png)
- ![terraform-platform2-check-plan](./src/terraform-platform2-check-plan.png)
- [---> main.tf](./terraform-lesson/main.tf)
- [---> vms_platform.tf](./terraform-lesson/vms_platform.tf)

### ***Задание 4***

- ![terraform-outputs](./src/terraform-outputs.png)
- [---> outputs.tf](./terraform-lesson/outputs.tf)

### ***Задание 5***

- ![terraform-locals](./src/terraform-locals.png)
- [---> locals.tf](./terraform-lesson/locals.tf)

### ***Задание 6***

- [---> vms_platform.tf](./terraform-lesson/vms_platform.tf)
- [---> variables.tf](./terraform-lesson/variables.tf)

### ***Задание 7***

- ![terraform-console](./src/terraform-console.png)