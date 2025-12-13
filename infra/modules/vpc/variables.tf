variable "cidr_block" {
  description = "Vpc cidr block"
  default     = "10.0.0.0/16"
}
variable "subnet_cidr" {
  description = "Subnets cidr block"
  default     = "10.0.1.0/24"
}
variable "availability_zone" {
  description = "Availability zone"
  default     = "ap-south-1a"
}
