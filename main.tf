terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}
module "aws_s3_logs" {
  source= "./modules/s3"
  bucket_name= var.logs_bucket_name
  Client= var.project
}

module "terraform_aws_vpc" {
  source="./modules/vpc"
  public_subnets= var.public_subnets
  private_subnets= var.private_subnets
}

module "terraform_aws_securitygroup" {
  source="./modules/security-group"
  vpc_id= module.terraform_aws_vpc.vpc_id
  cidr_block= module.terraform_aws_vpc.vpc_cidr_block
  ipv6_cidr_block= module.terraform_aws_vpc.vpc_ipv6_cidr_block
  group_name= var.group_name
  group_description= var.group_description
}
module "terraform_aws_lb" {
  source="./modules/lb"
  lb_name= var.lb_name
  lb_type= var.lb_type
  s3_bucket_bucket= module.aws_s3_logs.s3_bucket_bucket
  security_group_id= module.terraform_aws_securitygroup.security_group_id
  public_subnet_id= module.terraform_aws_vpc.public_subnet_id
}