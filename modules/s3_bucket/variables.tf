variable "s3_bucket_name" {
  type = string
}
variable "s3_object_key" {
  type = string
  default = null
}
variable "principal_aws_identifiers" {
  description = "List of AWS Account IDs/IAM Role ARNs"
  type = list(string)
  default = []
}

variable "region" {
  type = string
  default = "ap-southeast-1"
}