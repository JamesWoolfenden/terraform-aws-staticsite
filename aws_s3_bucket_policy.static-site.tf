resource "aws_s3_bucket_policy" "static-site" {
  bucket = aws_s3_bucket.static-site.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "S3PolicyId1",
    "Statement": [
        {
            Sid": "DenyOutsideIPfromBucket",
            "Effect": "Deny",
            "Principal": "*",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation",
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:GetObjectVersion"
            ],
            "Resource": [
                "${aws_s3_bucket.static-site.arn}/*",
                "${aws_s3_bucket.static-site.arn}"], 
            "Condition": {
                "NotIpAddress": {
                    "aws:SourceIp": ${jsonencode(var.permitted_ip_ranges)}
                },
                "StringNotLike": {
                    "aws:PrincipalArn": ${jsonencode(var.permitted_iam)}
                }
            }
        }
    ]
}
POLICY
}