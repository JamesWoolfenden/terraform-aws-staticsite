
resource "aws_s3_bucket" "static_site" {

  # The following Checkov rules are disabled as they make no sense for a static site
  # checkov:skip=CKV_AWS_144: makes no sense
  # checkov:skip=CKV_AWS_145: Legacy v4 provider
  # checkov:skip=CKV_AWS_52: Legacy v4 provider
  # checkov:skip=CKV_AWS_57: Legacy v4 provider
  # checkov:skip=CKV_AWS_19: Legacy v4 provider
  # checkov:skip=CKV_AWS_21: Legacy v4 provider
  # checkov:skip=CKV_AWS_20: Legacy v4 provider
  # checkov:skip=CKV_AWS_18: Legacy v4 provider
  # checkov:skip=CKV2_AWS_6: public by design
  # checkov:skip=CKV2_AWS_41: no logging
  # checkov:skip=CKV2_AWS_40: Encryption makes no sense here
  # checkov:skip=CKV2_AWS_38: public by design
  # checkov:skip=CKV2_AWS_39: public by design

  bucket = var.s3_bucket_name

  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.static_site.bucket

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_acl" "static_site" {
  bucket = aws_s3_bucket.static_site.bucket
}

resource "aws_s3_bucket_versioning" "static_site" {
  bucket = aws_s3_bucket.static_site.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_cors_configuration" "static_site" {
  bucket = aws_s3_bucket.static_site.bucket

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}
