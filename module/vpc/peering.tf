resource "aws_vpc_peering_connection" "default-vpc-to-roboshop-vpc" {
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = "vpc-002e2deffd048729c"
  vpc_id        = aws_vpc.vpc.id
  auto_accept   = true

  tags = {
    Name = "default-vpc-to-roboshop-vpc"
  }
}