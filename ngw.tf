# Elastic IP for NAT GW
resource "aws_eip" "ngw-ip" {
  vpc      = true
    tags = {
    Name = "roboshop-${var.ENV}-ngw-eip"
  }
}


# Create NAT GW to expose public NW to private machines

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-ip.id
  subnet_id     = aws_subnet.public_subnet.*.id[0]

  tags = {
    Name = "roboshop-${var.ENV}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_eip.ngw-ip]
}