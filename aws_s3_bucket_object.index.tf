resource "aws_s3_object" "index" {
  # checkov:skip=CKV_AWS_186: Public by design
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
  acl          = var.bucket_acl
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_s3_object" "_404" {
  # checkov:skip=CKV_AWS_186: Public by design
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "404.html"
  source       = "${path.module}/files/404.html"
  content_type = "text/html"
  acl          = var.bucket_acl
  lifecycle {
    ignore_changes = all
  }
}
