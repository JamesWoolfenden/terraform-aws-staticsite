variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = map(any)
}

variable "permitted_ip_ranges" {
  description = ""
  type        = list(any)
}

variable "s3_bucket_name" {
  description = ""
  type        = string
}
