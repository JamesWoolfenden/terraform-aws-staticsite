resource "aws_s3_bucket_policy" "static-site" {
  bucket = aws_s3_bucket.static-site.id

  policy = data.aws_iam_policy_document.bucket.json
}