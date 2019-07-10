resource "aws_s3_bucket_policy" "static-site" {
  bucket = aws_s3_bucket.static-site.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "S3PolicyId1",
    "Statement": [
        {
            "Sid": "IPAllow",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "${aws_s3_bucket.static-site.arn}/*", 
            "Condition": {
                "IpAddress": {
                    "aws:SourceIp": ${jsonencode(values(var.permitted_ip_ranges))}
                }
            }
        }
    ]
}
POLICY
}


