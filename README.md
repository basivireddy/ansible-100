

### Launch the Ec2 Instances using Ansible
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


EOF

```
cat << EOF >> /etc/ansible/hosts
[assignment]


EOF

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

