locals {
  bucketname = "static-site-${data.aws_caller_identity.current.account_id}-${var.environment}"
}
