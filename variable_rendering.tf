resource "aws_s3_bucket" "default" {
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_arn
      }
    }
  }
  tags = {
    yor_trace = "7dec3e6a-0d32-4497-b808-7f91b0d02e70"
  }
}