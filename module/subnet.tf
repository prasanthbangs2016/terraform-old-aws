resource "aws_subnet" "main" {
  count     = length(data.aws_availability_zones.available.id)
  vpc_id    = aws_vpc.VPC.id
  cidr_block = cidrsubnet(var.VPC_CIDR, 8, count.index)

     tags = {
        Name    = "Subnet-${count.index}"
        IACTOOL    = local.IAC
    }
}