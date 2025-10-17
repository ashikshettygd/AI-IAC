provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "free_tier_bucket" {
  bucket = "free-tier-bucket-${random_string.suffix.id}"
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

  tags = {
    Name        = "Free Tier S3 Bucket"
    Environment = "Dev"
  }

  lifecycle_rule {
    enabled = true

    expiration {
      days = 30
    }

    noncurrent_version_expiration {
      days = 30
    }
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

output "s3_bucket_name" {
  value = aws_s3_bucket.free_tier_bucket.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.free_tier_bucket.arn
}