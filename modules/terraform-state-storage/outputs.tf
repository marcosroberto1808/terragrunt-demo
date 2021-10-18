output "bucket_name" {
  value = aws_s3_bucket.terraform-state-storage.bucket
  description = "The name of the S3 Bucket."
}

output "db_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table."
}