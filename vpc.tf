

resource "aws_vpc" "lab_vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lab_vpc.id
}
