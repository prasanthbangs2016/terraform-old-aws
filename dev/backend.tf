provider "aws" {
    region = "us-east-1"
  
}

terraform {
  backend "s3" {
    bucket = "terraform-s3-statefile"
    key    = "old-class/dev/terraform.tfstate"
    region = "us-east-1"
    
  }
}