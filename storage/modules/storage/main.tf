provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "s3bucket_20251022_183907" {
  bucket = "s3bucket-20251022-183907"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

output "bucket_name" {
  value = aws_s3_bucket.s3bucket_20251022_183907.id
}

output "bucket_arn" {
  value = aws_s3_bucket.s3bucket_20251022_183907.arn
}