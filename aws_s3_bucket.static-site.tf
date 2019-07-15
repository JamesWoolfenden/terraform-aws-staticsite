resource "aws_s3_bucket" "static-site" {
  bucket = var.s3_bucket_name
  acl    = "public-read"
  force_destroy=var.force_destroy

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

  tags = var.common_tags
}
