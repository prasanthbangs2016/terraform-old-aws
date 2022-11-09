resource "aws_subnet" "private-subnets" {
  count     = length(data.aws_availability_zones.available.names)
  vpc_id    = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.VPC_CIDR, 8, count.index)

     tags = {
        Name    = "Roboshop-Dev-Subnet-${count.index+1}"
        IACTOOL    = local.IAC
    }
}

#associating route table to subnets
resource "aws_route_table_association" "private-route-table-associate" {
  count     = length(data.aws_availability_zones.available.names)
  #taking 1 by 1 subnet attaching route table
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.route-table-private.id
}