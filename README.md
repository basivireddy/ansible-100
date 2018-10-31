

### Launch the Ec2 Instances using Ansible


test

1. Install awscli
```
pip install awscli

export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''

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

```


3. Install Basic Packages

```

ansible-playbook -i hosts configure_host.yml

ansible-playbook -i hosts configure_host2.yml

```

4. Run webserver
```
ansible-playbook -i hosts apache_invokedockercompose.yml


```

5. Run Couchdb
```

ansible-playbook -i hosts couchdb_invokedockercompose.yml

```

