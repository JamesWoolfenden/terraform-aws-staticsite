variable "permitted_ip_ranges" {
  description = "IP Address ranges permitted to access S3 bucket website."
  type        = list(any)
}

variable "permitted_iam" {
  description = "iam roles with access to S3 bucket website."
  type        = list(any)
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
  default = "public-read"
}

variable "versioning" {
  type        = bool
  default     = true
  description = "Switch to control versioning"
}

variable "access_log_bucket" {
  type        = string
  default     = "access_log_record"
  description = "Name of your access logging bucket"
}
