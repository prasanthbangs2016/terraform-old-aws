locals {
    VPC_NAME    = "${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}-VPC"
    IAC         = "${var.TAGS["IACTOOL"]}"
}