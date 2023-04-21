resource "aws_vpc_peering_connection" "peer" {
  #peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = "vpc-0ace177c971986a50"

}