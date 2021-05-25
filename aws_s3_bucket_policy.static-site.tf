resource "aws_s3_bucket_policy" "static-site" {
  bucket = aws_s3_bucket.static-site.id

  policy = <<POLICY
{
  "Id": "ExamplePolicy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowSSLRequestsOnly",
      "Action": "s3:*",
      "Effect": "Deny",
      "Resource": [
        "${aws_s3_bucket.static-site.arn}",
        "${aws_s3_bucket.static-site.arn}/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "*"
    }
  ]
}
POLICY
}
