provider "aws" {
  region     = "${var.aws_region}"
}

resource "aws_security_group" "dev_sg1" {
  name        = "dev_sg1"
  description = "Used for access to the dev instance"

  #SSH

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.localip}"]
  }

  #HTTP

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  #Outbound internet access

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "dev_sg2" {
  name        = "dev_sg2"
  description = "Used for access to the dev instance"

  #SSH

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.localip}"]
  }

  #HTTP

  ingress {
    from_port   = 5984
    to_port     = 5984
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  #Outbound internet access

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#key pair

resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}


resource "aws_instance" "app1" {
  count = 1

  ami           = "ami-0e32ec5bc225539f5"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.dev_sg1.name}"]
  key_name = "${aws_key_pair.auth.id}"
  tags {
    Name = "MSR-test-Instance-1"
  }
}


resource "aws_instance" "app2" {
  count = 1

  ami           = "ami-0e32ec5bc225539f5"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.dev_sg2.name}"]
  key_name = "${aws_key_pair.auth.id}"
  tags {
    Name = "MSR-test-Instance-2"
  }
}




resource "null_resource" "ansible_addhost" {

provisioner "local-exec" {
    command = <<EOD
cat <<EOF > aws_hosts 
[assignment]
${aws_instance.app1.public_ip}
${aws_instance.app2.public_ip}
        
[webserver] 
${aws_instance.app1.public_ip}
        
[dbserver] 
${aws_instance.app2.public_ip}
EOF
EOD
}
}

resource "null_resource" "webserver_configure" {
  provisioner "local-exec" {
    command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.app1.id} && aws ec2 wait instance-status-ok --instance-ids ${aws_instance.app2.id} && ansible-playbook -i aws_hosts basicpackages.yml"
  }
}

