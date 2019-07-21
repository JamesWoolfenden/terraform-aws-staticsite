data "aws_iam_policy_document" "bucket" {
  statement {
    sid    = "DenyOutsideIPfromBucket"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:GetObjectVersion"
    ]

    resources = [
      "${aws_s3_bucket.static-site.arn}/*",
    "${aws_s3_bucket.static-site.arn}"]

    condition {
      test     = "NotIpAddress"
      variable = "aws:SourceIp"
      values   = [jsonencode(var.permitted_ip_ranges)]
    }

    condition {
      test     = "StringNotLike"
      variable = "aws:PrincipalArn"
      values   = [jsonencode(var.permitted_iam)]
    }
  }
}
