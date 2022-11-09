resource "aws_subnet" "main" {
  count     = length(data.aws_availability_zones.available.names)
  vpc_id    = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.VPC_CIDR, 8, count.index)

     tags = {
        Name    = "Roboshop-Dev-Subnet-${count.index+1}"
        IACTOOL    = local.IAC
    }
}