variable "virginia_cidr" {
  description = "CIDR Virginia"
  # type        = map(string)
  type = string
}

# variable "public_subnet_cidr" {
#     description = "CIDR public subnet"
#     type = string
# }

# variable "private_subnet_cidr" {
#     description = "CIDR private subnet"
#     type = string
# }

variable "subnets" {
  description = "List of subnets"
  type        = list(string)
}

variable "tags" {
  description = "project's tags"
  type        = map(string)
}

variable "ingress_cidr" {
  description = "CIDR for ingressTraffic"
  type        = string
}

variable "ec2_specs" {
  description = "parámetros de la instancia"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "enable monitoring instance"
  type        = number
}

variable "ingress_port_list" {
  description = "list of ports - ingress"
  type = list(number)
}