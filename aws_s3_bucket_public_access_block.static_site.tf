resource "aws_s3_bucket_public_access_block" "static_site" {
  # checkov:skip=CKV_AWS_53: Not appropriate
  # checkov:skip=CKV_AWS_54: Not appropriate
  # checkov:skip=CKV_AWS_55: Not appropriate
  # checkov:skip=CKV_AWS_56: Not appropriate
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  restrict_public_buckets = false
  block_public_policy     = false
  ignore_public_acls      = false
}
