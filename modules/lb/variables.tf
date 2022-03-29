variable "lb_name" {
    type = string
    description = "name for the lb"
}
variable "lb_type" {
    type = string
    description = "type of the lb"
}
variable "security_group_id" {
    type = string
    description = "id of the security group"
}
variable "public_subnet_id" {
    type = string
    description = "ids of the public subnet"
}
variable "s3_bucket_bucket" {
    type = string
    description = "logs bucket"
}
variable "project" {
    type = string
    description = "name for the project"
}