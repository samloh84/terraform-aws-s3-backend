data "aws_caller_identity" "caller_identity" {}

data "aws_iam_policy_document" "iam_policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"]
    resources = [
      "arn:aws:s3:::${module.s3_bucket_tags.name}"]
    principals {
      identifiers = local.principal_aws_identifiers
      type = "AWS"
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject"]
    resources = [
      "arn:aws:s3:::${module.s3_bucket_tags.name}/${local.s3_object_key}"]
    principals {
      identifiers = local.principal_aws_identifiers
      type = "AWS"
    }
  }
}


locals {
  s3_object_key = coalesce(var.s3_object_key, "*")
  principal_aws_identifiers = coalescelist(var.principal_aws_identifiers, [
    data.aws_caller_identity.caller_identity.account_id])

}