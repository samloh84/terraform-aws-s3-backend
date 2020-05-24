output "bucket" {
  value = module.s3_bucket.s3_bucket_name
}

output "key" {
  value = local.terraform_state_key
}

output "region" {
  value = var.region
}

output "dynamodb_table" {
  value = module.dynamodb_table.dynamodb_table_name
}

