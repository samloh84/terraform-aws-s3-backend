variable "resource_name" {
  type = string
}

variable "resource_full_name" {
  type = string
  default = null
}


variable "resource_type" {
  type = string
}

variable "delimiter" {
  type = string
  default = "-"
}

variable "owner" {
  type = string
}
variable "project" {
  type = string
}

variable "custom_tags" {
  type = map(string)
  default = {}
}
