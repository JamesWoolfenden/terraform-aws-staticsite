resource "aws_s3_bucket" "static-site" {
  bucket = local.bucketname
  acl    = "private"
  force_destroy="true"

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
