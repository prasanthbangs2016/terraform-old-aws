resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

      tags = {
        Name    = "${local.VPC_NAME}-IGW"
        IACTOOL    = local.IAC
    }
}