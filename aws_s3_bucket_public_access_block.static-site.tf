resource "aws_s3_bucket_public_access_block" "static-site" {
  # checkov:skip=CKV_AWS_53: Not appropriate
  # checkov:skip=CKV_AWS_54: Not appropriate
  # checkov:skip=CKV_AWS_55: Not appropriate
  # checkov:skip=CKV_AWS_56: Not appropriate
  bucket = aws_s3_bucket.static-site.id

  # tfsec:ignore:AWS074
  block_public_acls = false
  # tfsec:ignore:AWS075
  restrict_public_buckets = false
  # tfsec:ignore:AWS076
  block_public_policy = false
  # tfsec:ignore:AWS073
  ignore_public_acls = false
}