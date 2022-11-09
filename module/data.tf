#this pulls all the availability zones avail from region
data "aws_availability_zones" "available" {
    state   = "available"
}

#to check
resource "null_resource" "null" {
    provisioner "local-exec" {
        #command = "echo ${data.aws_availability_zones.available.id)}"
        command = "echo ${length(data.aws_availability_zones.available.names)}"
      
    }
  
}