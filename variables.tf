variable "common_tags" {
  type = map
}

variable "environment" {
  type = string
}

variable "permitted_ip_ranges" {
  description = "IP Address ranges permitted to access S3 bucket website."
  type        = list
}

variable "s3_bucket_name" {
  type        = string
  description = "The raw name of the bucket"
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "bucket_acl" {
  type    = string
  default = "Private"
}

