resource "aws_s3_bucket" "terraform-state-storage" {
#  bucket = "terraform-up-and-running-state"
  bucket = var.bucket_name
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = false
  }
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = false
  }
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = format("%s-locks", var.bucket_name)
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}