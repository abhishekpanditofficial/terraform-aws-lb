output "vpc_id" {
    value= module.terraform_aws_vpc.vpc_id
}
output "vpc_cidr_block" {
    value= module.terraform_aws_vpc.vpc_cidr_block
}
output "security_group_arn" {
    value= module.terraform_aws_securitygroup.security_group_arn
}
output "alb_id" {
    value= module.terraform_aws_lb.alb_id
}