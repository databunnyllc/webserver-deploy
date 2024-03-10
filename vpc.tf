# Create the lab vpc

resource "aws_vpc" "lab_vpc" {
  cidr_block = "172.16.0.0/16"
}

# Create a subnet called public subnet and associating it to the
# lab vpc.

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "us-east-1a"
}

# Create a internet gateway, and then associate it to the lab vpc.  

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lab_vpc.id
}
