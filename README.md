# Comandos Úteis

```shell
terraform init
tree -a -I '.idea|.git'
```

## Roteiro

1. `terraform init`
2. `terraform plan`
3. `terraform apply`
4. Vai dar erro. Troque a AMI para uma válida do Ubuntu 18.04 LTS `ami-0e472ba40eb589f49`
5. Mostre que foram criados arquivos de lock e state, alguns não versionados
6. Mostre que algumas alterações não podem ser feitas in-place, trocando para Ubuntu 20.04 LTS `ami-04505e74c0741db8d`
7. Crie o grupo de segurança para aceitar HTTP, e mostre que ele foi adicionado sem recriar nada
8. Use `terraform show | ack ip` para pegar o IP público e pingar a máquina
9. O ping irá falhar. Crie uma regra para liberar ICMP no security group e teste novamente
10. Remova a regra de ICMP do security group e veja que voltou a bloquear
11. Destrua os recursos criados usando `terraform destroy`
12. Mostre como se usa variáveis, criando o arquivo `variables.tf`
13. Mantenha os mesmos valores de variáveis, e execute `terraform apply`. Nada deve mudar
14. Mostre que é possível alterar os valores usando o comando `terraform apply -var 'instance_name=new_name'`
15. Talvez seja útil visitar https://www.terraform.io/language/values/variables
16. Agora mostre como cuspir valores criando o arquivo `outputs.tf` e execute `terraform apply`
17. Mostre que tambem temos `terraform output` ou `terraform output instance_public_ip`

Se der tempo, mostrar remote state. Ou na AWS, ou no Terraform Cloud (https://learn.hashicorp.com/tutorials/terraform/aws-remote?in=terraform/aws-get-started)
