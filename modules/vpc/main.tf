resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
      Name = "vpc-terraform"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_eip" "nateIP" {
   vpc   = true
 }

resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id = aws_subnet.public_subnets.id
 }

resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnets  
}

resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnets
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "key" = "value"
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
}

resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.public_subnets.id
    route_table_id = aws_route_table.route_table_public.id
 }

resource "aws_route_table_association" "PrivateRTassociation" {
    subnet_id = aws_subnet.private_subnets.id
    route_table_id = aws_route_table.route_table_private.id
 }