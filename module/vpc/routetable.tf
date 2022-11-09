resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = data.aws_vpc.management.cidr_block
    vvpc_peering_connection_id = aws_vpc_peering_connection.management-vpc-to-roboshop-vpc.id
  }
   tags = {
        Name        = "${local.VPC_NAME}-Private-Route-Table"
        IACTOOL     = local.IAC
    }
}

