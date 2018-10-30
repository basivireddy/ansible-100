

### Launch the Ec2 Instances using Ansible

1. Install awscli
```
pip install awscli

aws configure

```
1. create the aws-creditails file
```
mkdir templates
cat << EOF > templates/awscreds.yml
aws_id : ""
aws_key : ""
aws_region: "us-west-2"

EOF

```
2. Play the ec2_lauch playbook

```
ansible-playbook ec2_lauch.yml 
cat << EOF >> /etc/ansible/hosts
[assignment]
host1  ansible_host= ansible_user=ubuntu ansible_ssh_private_key_file=templates/my_keypair.pem
host2  ansible_host= ansible_user=ubuntu ansible_ssh_private_key_file=templates/my_keypair.pem

EOF

```


3. Install Basic Packages

```

ansible-playbook configure_host.yml
ansible-playbook configure_host2.yml

```

4. Run webserver
```
ansible-playbook apache_invokedockercompose.yml -e "webserver=host1"


```

5. Run Couchdb
```

ansible-playbook couchdb_invokedockercompose.yml -e "couchdb=host2"

```

