resource "aws_s3_bucket" "static-site" {
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  #checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"

  bucket        = var.s3_bucket_name
  acl           = var.bucket_acl
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  logging {
    target_bucket = var.access_log_bucket
  }

  tags = var.common_tags
}
