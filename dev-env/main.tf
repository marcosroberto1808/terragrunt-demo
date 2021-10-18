provider "aws" {
  region = var.aws_region
}

module "terraform-state-storage" {
  source = "../modules/terraform-state-storage"
  bucket_name = format("s3-%s-%s-terraform-state-storage", var.cluster, var.environment)
}

#terraform {
#  backend "s3" {
#    key = "global/s3/terraform.tfstate"
#  }
#}