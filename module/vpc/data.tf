#this pulls all the availability zones avail from region
data "aws_availability_zones" "available" {
    state   = "available"
}

#to check how manay availability zone available
resource "null_resource" "null" {
    provisioner "local-exec" {
        #command = "echo ${data.aws_availability_zones.available.id)}"
        command = "echo ${length(data.aws_availability_zones.available.names)}"
      
    }
  
}

#to get aws account id for peering connection
data "aws_caller_identity" "current" {}

#pulling default vpc id
data "aws_vpc" "management" {
    id = var.MANAGEMENT_VPC_ID
}

#pulling all the 6 route tables
data "aws_route_tables" "management-vpc-route-table" {
  vpc_id = var.MANAGEMENT_VPC_ID

}