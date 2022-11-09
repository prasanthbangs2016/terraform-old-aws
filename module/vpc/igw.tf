resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

      tags = {
        Name    = "${local.VPC_NAME}-IGW"
        IACTOOL    = local.IAC
    }
}

resource "aws_eip" "eip" {
    tags = {
        Name    = "${local.VPC_NAME}-EIP"
        IACTOOL    = local.IAC
    }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  #it will take 1st one and put it in subnet
  subnet_id     = element(aws_subnet.public-subnets.*.id, 0)

  tags = {
        Name    = "${local.VPC_NAME}-NGW"
        IACTOOL    = local.IAC
    }

}