resource "aws_s3_bucket" "static-site" {
  # The following Checkov rules are disabled as they make no sense for a static site
  # checkov:skip=CKV_AWS_144: makes no sense
  # checkov:skip=CKV_AWS_145: Encryption makes no sense here
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  # checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  # checkov:skip=CKV_AWS_20: "S3 Bucket has an ACL defined which allows public READ access."
  # checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"

  bucket = var.s3_bucket_name

  #You can't have a canned ACL and a bucket policy
  acl           = var.bucket_acl
  force_destroy = var.force_destroy

  versioning {
    enabled = false
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  tags = var.common_tags
}
