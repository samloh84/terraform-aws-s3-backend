module "dynamodb_table_tags" {
  source = "../__tags"
  owner = var.owner
  project = var.project
  resource_full_name = var.dynamodb_table_name
  resource_name = "tf-backend"
  resource_type = "dynamodb"
}


resource "aws_dynamodb_table" "dynamodb_table" {
  hash_key = "LockID"
  name = module.dynamodb_table_tags.name
  billing_mode = local.billing_mode
  read_capacity = local.read_capacity
  write_capacity = local.write_capacity



  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = module.dynamodb_table_tags.tags
}
locals {
  billing_mode = coalesce(var.billing_mode, "PROVISIONED")
  read_capacity = coalesce(var.read_capacity, 5)
  write_capacity = coalesce(var.write_capacity, 5)
}