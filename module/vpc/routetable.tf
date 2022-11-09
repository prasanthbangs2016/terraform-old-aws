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

resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = data.aws_vpc.management.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.default-vpc-to-roboshop-vpc.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    #gateway id is nothing but igw id
    gateway_id = aws_internet_gateway.gw.id
  }


   tags = {
        Name        = "${local.VPC_NAME}-public-Route-Table"
        IACTOOL     = local.IAC
    }
}

resource "aws_route" "management-vpc-peering-route" {
  #route table id expects a string hence convered with locals and added here.
  route_table_id            = local.MANAGEMENT_ROUTE_TABLE
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.default-vpc-to-roboshop-vpc.id

}

