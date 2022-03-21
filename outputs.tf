
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "s3" {
  value = aws_s3_bucket.static_site
}
