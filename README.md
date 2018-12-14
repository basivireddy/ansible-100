

### Launch the Ec2 Instances using Terraform

1. terraform
```

ssh-keygen

modify the public_key_path varibales in terraform.tfvars

terraform init
terraform plan
terraform apply
terraform show

```

2. Install Basic Packages

```
ansible-playbook -i aws_hosts basicpackages.yml
ansible-playbook -i aws_hosts configure_hosts.yml

```

3. Run webserver
```
ansible-playbook -i aws_hosts webserver.yml


```

4. Run Couchdb
```

ansible-playbook -i aws_hosts dbserver.yml

```

