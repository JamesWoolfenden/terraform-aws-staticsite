variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = map
}

variable "permitted_ip_ranges" {
  description=""
  type = list
}

variable "s3_bucket_name" {
  description=""
  type = string
}