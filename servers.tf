# Create the AWS 2023 Linux Server instance

resource "aws_instance" "webserver" {
  ami               = "ami-0f403e3180720dd7e"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"

  depends_on = [aws_internet_gateway.igw]

  # Attach the webserver NIC to the instance

  network_interface {
    network_interface_id = aws_network_interface.webserver.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

# Create elastic ip association for the webserver

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.public_ip.id
}

# Create elastic ip 
resource "aws_eip" "public_ip" {
  domain = "vpc"
}