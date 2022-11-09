resource "aws_vpc" "vpc" {
    cidr_block = var.VPC_CIDR
    tags = {
        Name    = local.VPC_NAME
        IACTOOL    = local.IAC
    }
  
}