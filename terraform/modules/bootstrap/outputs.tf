output "logging_bucket_name" {
  value = aws_s3_bucket.logging.id
}

output "logging_bucket_arn" {
  value = aws_s3_bucket.logging.arn
}

output "logging_bucket_key_arn" {
  value = aws_kms_key.logging.arn
}

output "state_bucket_name" {
  value = aws_s3_bucket.state.id
}

output "state_bucket_arn" {
  value = aws_s3_bucket.state.arn
}

output "state_bucket_key_arn" {
  value = aws_kms_key.state.arn
}

output "state_table_name" {
  value = aws_dynamodb_table.state.name
}

output "state_table_arn" {
  value = aws_dynamodb_table.state.arn
}
