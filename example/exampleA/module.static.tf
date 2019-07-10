module "static" {
  source      = "../../"
  common_tags         = var.common_tags
  permitted_ip_ranges = var.permitted_ip_ranges
  environment         = var.environment
  s3_bucket_name      = var.s3_bucket_name
}
