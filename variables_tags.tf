
variable "owner" {
  type = string
}
variable "project" {
  type = string
}

variable "dynamo_db_custom_tags" {
  type = map(string)
  default = {}
}

variable "s3_bucket_custom_tags" {
  type = map(string)
  default = {}
}
