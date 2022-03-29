variable "group_name" {
  type = "string"
  description = "name of the security group"
  default = "test-security-group"
}

variable "group_description" {
  type = "string"
  description = "description of the group"
  default = "test-description"
}
variable "vpc_id" {
  type = "string"
  description = "id of the vpc"
}
variable "cidr_block" {
  type = "string"
  description = "cidr block of the vpc"
}
variable "ipv6_cidr_block" {
  type = "string"
  description = "1pv6 cidr block of the vpc"
}