

### Launch the Ec2 Instances using Terraform

1. terraform
```
cd terraform
terraform init
terraform apply
terraform show

```

2. Install Basic Packages

```

ansible-playbook -i hosts configure_host.yml

ansible-playbook -i hosts configure_host2.yml

```

3. Run webserver
```
ansible-playbook -i hosts apache_invokedockercompose.yml


```

4. Run Couchdb
```

ansible-playbook -i hosts couchdb_invokedockercompose.yml

```

