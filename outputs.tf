
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "s3_name" {
  value = aws_s3_bucket.static-site.bucket_domain_name
}

output "s3_id" {
  value       = aws_s3_bucket.static-site.id
  description = "The name of the bucket."
}

output "s3_arn" {
  value       = aws_s3_bucket.static-site.arn
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
}

output "s3_bucket_domain_name" {
  value       = aws_s3_bucket.static-site.bucket_domain_name
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
}

output "s3_bucket_regional_domain_name" {
  value       = aws_s3_bucket.static-site.bucket_regional_domain_name
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
}

output "s3_hosted_zone_id" {
  value       = aws_s3_bucket.static-site.hosted_zone_id
  description = "The Route 53 Hosted Zone ID for this bucket's region."
}

output "s3_region" {
  value       = aws_s3_bucket.static-site.region
  description = "The AWS region this bucket resides in."
}

output "s3_website_endpoint" {
  value       = aws_s3_bucket.static-site.website_endpoint
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
}

output "s3_website_domain" {
  value       = aws_s3_bucket.static-site.website_domain
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
}