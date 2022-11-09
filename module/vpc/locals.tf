locals {
    VPC_NAME    = "${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}-VPC"
    IAC         = "${var.TAGS["IACTOOL"]}"
    #since we have multiple route table and its list hence converting as route expects a string 
    MANAGEMENT_ROUTE_TABLE = join(", ", data.aws_route_tables.management-vpc-route-table.ids)
}