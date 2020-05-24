provider "aws" {
  region = var.region
}

locals {
  terraform_state_key = coalesce(var.terraform_state_key, join("/", [
    var.project,
    "terraform.tfstate"]))
}

module "s3_bucket" {
  source = "./modules/s3_bucket"
  s3_bucket_name = var.s3_bucket_name
  owner = var.owner
  project = var.project
  custom_tags = var.s3_bucket_custom_tags
  principal_aws_identifiers = var.principal_aws_identifiers
  region = var.region
  s3_object_key = var.terraform_state_key

}


module "dynamodb_table" {
  source = "./modules/dynamodb_table"

  dynamodb_table_name = var.dynamodb_table_name
  owner = var.owner
  project = var.project
  custom_tags = var.dynamo_db_custom_tags
  principal_aws_identifiers = var.principal_aws_identifiers
  billing_mode = var.dynamodb_table_billing_mode
  read_capacity = var.dynamodb_table_read_capacity
  write_capacity = var.dynamodb_table_write_capacity
}

resource "local_file" "backend_tf_file" {
  filename = "${var.project}-backend-config.tf.bak"
  content = <<-EOF
terraform {
  backend "s3" {
    bucket = "${module.s3_bucket.s3_bucket_name}"
    key = "${local.terraform_state_key}"
    region = "${var.region}"
    dynamodb_table = "${module.dynamodb_table.dynamodb_table_name}"
  }
}
EOF

}
