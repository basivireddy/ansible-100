provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
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
  }

  #HTTP

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
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
  }

  #HTTP

  ingress {
    from_port   = 5984
    to_port     = 5984
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  count = 1

  ami           = "ami-0e32ec5bc225539f5"
  instance_type = "t1.micro"
  security_groups = ["dev_sg1"]
  key_name = "my_keypair"
  tags {
    Name = "MSR-test-Instance-1"
  }
}


resource "aws_instance" "app2" {
  count = 1

  ami           = "ami-0e32ec5bc225539f5"
  instance_type = "t1.micro"
  security_groups = ["dev_sg2"]
  key_name = "my_keypair"
  tags {
    Name = "MSR-test-Instance-2"
  }
}

