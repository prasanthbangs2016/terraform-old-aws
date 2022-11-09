resource "aws_vpc_peering_connection" "default-vpc-to-roboshop-vpc" {
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = var.MANAGEMENT_VPC_ID
  vpc_id        = aws_vpc.vpc.id
  auto_accept   = true

  tags = {
    Name = "management-vpc-to-roboshop-vpc"
  }
}