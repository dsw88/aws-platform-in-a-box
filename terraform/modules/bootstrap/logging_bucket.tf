resource "aws_s3_bucket" "logging" {
  bucket = local.logging_bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_acl" "logging" {
  depends_on = [aws_s3_bucket_ownership_controls.logging]
  bucket     = aws_s3_bucket.logging.id
  acl        = "log-delivery-write"
}

resource "aws_s3_bucket_ownership_controls" "logging" {
  bucket = aws_s3_bucket.logging.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "logging" {
  bucket                  = aws_s3_bucket.logging.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "logging" {
  description             = "Key used to encrypt the S3 logging bucket"
  deletion_window_in_days = 7
  tags                    = var.tags
}

resource "aws_kms_alias" "logging" {
  name          = "alias/s3-${local.logging_bucket_name}"
  target_key_id = aws_kms_key.logging.key_id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logging" {
  bucket = aws_s3_bucket.logging.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.logging.arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}
