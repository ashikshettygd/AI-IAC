provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "versioned_bucket" {
  bucket = "my-versioned-bucket"
  versioning {
    enabled = true
  }
}

output "bucket_name" {
  value = aws_s3_bucket.versioned_bucket.id
}