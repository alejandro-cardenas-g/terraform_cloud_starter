terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.33.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.8.1"
    }
  }
  required_version = "~>1.14.7"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "aws" {
  region = "us-east-2"
  alias  = "aws-ohio"
}
