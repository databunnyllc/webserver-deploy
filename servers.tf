resource "aws_instance" "webserver" {
  ami           = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.webserver.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}