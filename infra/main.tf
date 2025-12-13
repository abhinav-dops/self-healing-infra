terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  az          = var.az
}

module "ec2" {
  source          = "./modules/ec2"
  ami             = var.ami
  instance_type   = var.instance_type
  vpc_id          = module.vpc.vpc_id
  subnet_id       = module.vpc.subnet_id
  key_name        = var.key_name
  public_key_path = var.public_key_path
  user_data_path  = var.user_data_path
}
