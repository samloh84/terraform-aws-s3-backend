output "s3_bucket" {
  value = aws_s3_bucket.s3_bucket
}
output "s3_bucket_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}
output "s3_bucket_key" {
  value = ""
}
