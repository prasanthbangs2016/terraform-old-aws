module "VPC" {
  source = "../module/vpc"
  VPC_CIDR = var.VPC_CIDR
  TAGS     = var.TAGS
  MANAGEMENT_VPC_ID = var.MANAGEMENT_VPC_ID
}