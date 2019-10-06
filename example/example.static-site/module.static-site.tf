module "static" {
  source              = "../../"
  common_tags         = var.common_tags
  permitted_ip_ranges = concat(var.permitted_ip_ranges, var.slalom_ip)
  permitted_iam = [
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*",
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*"]
  s3_bucket_name = var.s3_bucket_name
  bucket_acl     = "Private"
}
