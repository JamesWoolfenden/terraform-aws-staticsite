resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.static-site.bucket
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
  acl          = var.bucket_acl
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_s3_bucket_object" "_404" {
  bucket       = aws_s3_bucket.static-site.bucket
  key          = "404.html"
  source       = "${path.module}/files/404.html"
  content_type = "text/html"
  acl          = var.bucket_acl
  lifecycle {
    ignore_changes = all
  }
}
