# Create network interface card for webserver.

resource "aws_network_interface" "webserver" {
  subnet_id   = aws_subnet.public_subnet.id
  private_ips = ["172.16.1.10"]

  tags = {
    Name = "primary_network_interface"
  }
}