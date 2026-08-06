resource "aws_vpc" "learning" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = { Name = "terraform-learning-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.learning.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = { Name = "terraform-learning-public-subnet" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.learning.id
  tags   = { Name = "terraform-learning-igw" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.learning.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "terraform-learning-public-rt" }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}