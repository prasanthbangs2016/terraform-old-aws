#this pulls all the availability zones avail from region
data "aws_availability_zones" "available" {
    state   = "available"
}