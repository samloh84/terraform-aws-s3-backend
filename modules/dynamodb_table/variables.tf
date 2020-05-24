variable "dynamodb_table_name" {
type = string
}
variable "principal_aws_identifiers" {
  description = "List of AWS Account IDs/IAM Role ARNs"
  type = list(string)
  default = []
}
variable "billing_mode" {
  default = "PROVISIONED"
}
variable "read_capacity" {
  default = 5
}
variable "write_capacity" {
  default = 5
}