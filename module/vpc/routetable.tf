resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = data.aws_vpc.management.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.default-vpc-to-roboshop-vpc.id
  }
   tags = {
        Name        = "${local.VPC_NAME}-Private-Route-Table"
        IACTOOL     = local.IAC
    }
}

resource "aws_route" "management-vpc-peering-route" {
  route_table_id            = local.MANAGEMENT_ROUTE_TABLE
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.default-vpc-to-roboshop-vpc.id

}

