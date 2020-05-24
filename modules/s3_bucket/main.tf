module "s3_bucket_tags" {
  source = "../__tags"
  owner = var.owner
  project = var.project
  resource_full_name = var.s3_bucket_name
  resource_name = "tf-backend"
  resource_type = "s3"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = module.s3_bucket_tags.name
  acl = "private"
  policy = data.aws_iam_policy_document.iam_policy_document.json
region = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

  tags = module.s3_bucket_tags.tags
}
