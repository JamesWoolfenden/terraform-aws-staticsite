
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "s3_name" {
  value=aws_s3_bucket.static-site.bucket_domain_name
}