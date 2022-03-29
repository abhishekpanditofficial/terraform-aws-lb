variable "private_subnets" {
  type = string
  description = "private subnet of the vpc"
  default = "10.0.0.192/26"
}

variable "public_subnets" {
  type = string
  description = "public subnet of the vpc"
  default = "10.0.0.128/26"
}