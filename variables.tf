variable "region" {
  default = "ap-southeast-1"
  type = string
}


variable "dynamodb_table_name" {
  type = string
  default = null
}


variable "principal_aws_identifiers" {
  type = list(string)
  default = []
}
variable "s3_bucket_name" {
  type = string
  default = null
}
variable "terraform_state_key" {
  type = string
  default = null
}

variable "dynamodb_table_billing_mode" {
  default = null
}
variable "dynamodb_table_read_capacity" {
  default = null
}
variable "dynamodb_table_write_capacity" {
  default = null
}