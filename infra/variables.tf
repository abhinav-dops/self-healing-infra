variable "region" {
  default = "ap-south-1"
}

variable "ami" {
  default = "ami-00ca570c1b6d79f36"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "az" {
  default = "ap-south-1a"
}

variable "key_name" {}
variable "public_key_path" {}
variable "user_data_path" {}
