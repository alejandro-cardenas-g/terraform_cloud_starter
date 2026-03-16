virginia_cidr = "10.1.0.0/16"

# virginia_cidr = {
#   "prod" = "10.0.0.0/16"
#   "dev" = "10.100.0.0/16"
# }

# private_subnet_cidr = "10.1.0.0/24"
# public_subnet_cidr = "10.1.1.0/24"

subnets = ["10.1.0.0/24", "10.1.1.0/24"]

tags = {
  "Env" = "DEV"
  "IAC" = "terraform" 
  "project" = "projectx"
  "region" = "virginia"
}

ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-02dfbd4ff395f2a1b"
  "instance_type" = "t3.micro"
}

enable_monitoring = 0

ingress_port_list = [ 22, 80, 443 ]