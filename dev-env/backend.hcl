# backend.hcl
bucket = "s3-robertom-dev-terraform-state-storage"
region = "us-west-2"
dynamodb_table = "s3-robertom-dev-terraform-state-storage-locks"
encrypt = true

