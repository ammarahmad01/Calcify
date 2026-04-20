# VPC
resource "aws_vpc" "calcify_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "calcify-vpc"
  }
}

# Subnet
resource "aws_subnet" "calcify_subnet" {
  vpc_id            = aws_vpc.calcify_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "calcify-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "calcify_igw" {
  vpc_id = aws_vpc.calcify_vpc.id
  tags = {
    Name = "calcify-igw"
  }
}

# Route Table
resource "aws_route_table" "calcify_rt" {
  vpc_id = aws_vpc.calcify_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.calcify_igw.id
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "calcify_rta" {
  subnet_id      = aws_subnet.calcify_subnet.id
  route_table_id = aws_route_table.calcify_rt.id
}