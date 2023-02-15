# this is an example Terraform project that creates a virtual private cloud (VPC) in AWS with public and private subnets, an internet gateway, and a NAT gateway
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "example-internet-gateway"
  }
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.example.id

  tags = {
    Name = "example-public-subnet"
  }
}

resource "aws_subnet" "private" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.example.id

  tags = {
    Name = "example-private-subnet"
  }
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "example-nat-gateway"
  }
}

resource "aws_eip" "example" {
  vpc = true

  tags = {
    Name = "example-eip"
  }
 }
#In this example, the Terraform code creates an AWS VPC with a CIDR block of 10.0.0.0/16. It also creates an internet gateway, two subnets (one public and one private), a NAT gateway, and an Elastic IP address. The NAT gateway and Elastic IP are used to allow instances in the private subnet to access the internet.

# After writing the Terraform code, you can follow the steps outlined in my previous response to initialize, plan, and apply the changes to your infrastructure.