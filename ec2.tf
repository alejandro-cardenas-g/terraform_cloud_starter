# variable "instancias" {
#   description = "Nombre de las instancias"
#   type = list(string)
#   default = [ "apache","mysql","jumpserver" ]
# }

# resource "aws_instance" "public_instance" {
#   count = length(var.instancias)
#   ami           = var.ec2_specs["ami"]
#   instance_type = var.ec2_specs["instance_type"]
#   tags = {
#     Name = var.instancias[count.index]
#   }
#   subnet_id = aws_subnet.public_subnet.id
#   key_name  = data.aws_key_pair.ssh_key_pair.key_name

#   security_groups = [aws_security_group.public_instance_sg.id]

#   lifecycle {
#     create_before_destroy = true
#   }

#   user_data = file("scripts/userdata.sh")
# }


variable "instancias" {
  description = "Nombre de las instancias"
  type        = set(string)
  default     = ["apache"]
}

resource "aws_instance" "public_instance" {
  for_each      = var.instancias
  ami           = var.ec2_specs["ami"]
  instance_type = var.ec2_specs["instance_type"]
  tags = {
    Name = "${each.value}-${local.sufix}"
  }
  subnet_id = aws_subnet.public_subnet.id
  key_name  = data.aws_key_pair.ssh_key_pair.key_name

  security_groups = [aws_security_group.public_instance_sg.id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = file("scripts/userdata.sh")
}

resource "aws_instance" "monitoring_instance" {
  count         = var.enable_monitoring == 1 ? 1 : 0
  ami           = var.ec2_specs["ami"]
  instance_type = var.ec2_specs["instance_type"]
  tags = {
    Name = "Monitoring"
  }
  subnet_id = aws_subnet.public_subnet.id
  key_name  = data.aws_key_pair.ssh_key_pair.key_name

  security_groups = [aws_security_group.public_instance_sg.id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = file("scripts/userdata.sh")
}

resource "aws_security_group" "public_instance_sg" {
  name        = "Public instance SG"
  description = "Allow SSH"
  vpc_id      = aws_vpc.vpc_virginia.id

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.ingress_cidr]
    }
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "all"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }


  tags = {
    Name = "Sg for public instance"
  }
}
