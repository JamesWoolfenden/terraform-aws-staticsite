module "static" {
  source              = "../../"
  common_tags         = var.common_tags
  permitted_ip_ranges = var.permitted_ip_ranges
  permitted_iam       = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*"]
  s3_bucket_name      = "${var.s3_bucket_name}-${data.aws_caller_identity.current.account_id}"
}
