data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "selected_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

# Created with module
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.ec2_name}-${var.env}"

  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = true
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  subnet_id                   = data.aws_subnet.selected_subnet.id
  user_data                   = templatefile("${path.module}/user_data.sh", {})

  tags = {
    Terraform   = "true"
    Environment = var.env
    Name        = "${var.ec2_name}-${var.env}-module"
  }
}

resource "aws_security_group" "my_sg" {
  name   = var.sg_name
  vpc_id = data.aws_vpc.selected_vpc.id # var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}