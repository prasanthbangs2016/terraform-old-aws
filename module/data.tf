#this pulls all the availability zones avail from region
data "aws_availability_zones" "available" {
    state   = "available"
}

resource "null_resource" "null" {
    provisioner "local-exec" {
        command = "echo ${length(data.aws_availability_zones.available.id)}"
      
    }
  
}