variable "common_tags" {
  type = map
}

variable "permitted_ip_ranges" {
  type = list
}

variable "environment" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "slalom_ip" {
  type = list
}
