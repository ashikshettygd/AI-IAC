provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-s3-bucket"
  versioning {
    enabled = true
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.id
}