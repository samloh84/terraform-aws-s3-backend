data "aws_caller_identity" "caller_identity" {}

data "aws_iam_policy_document" "iam_policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"]
    resources = [
      "arn:aws:dynamodb:*:*:table/${module.dynamodb_table_tags.name}"]
    principals {
      identifiers = coalescelist(var.principal_aws_identifiers, [
        data.aws_caller_identity.caller_identity.account_id])
      type = "AWS"
    }
  }
}
