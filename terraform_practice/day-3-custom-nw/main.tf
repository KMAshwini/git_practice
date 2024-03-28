#create vpc
resource "aws_vpc" "dev" {
cidr_block = "10.0.0.0/16"
tags = {
    Name = "dev"
} 
}
resource "aws_eip" "dev" {
  domain = "vpc"
}

#create internet gateway and attach to vpc
resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
}
#create subnet
resource "aws_subnet" "dev_pub" {
    cidr_block =  "10.0.0.0/24"
    vpc_id = aws_vpc.dev.id
}

#create route table and attach internet gateway to rt
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
  
}

#subnet association
resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.dev_pub.id
}

#Natgateway
resource "aws_nat_gateway" "dev_pvt" {
  allocation_id = aws_eip.dev.id
  subnet_id     = aws_subnet.dev_pub.id
  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.dev]
}



