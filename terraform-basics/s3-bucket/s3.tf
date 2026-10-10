terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# S3 bucket names are globally unique across all AWS accounts
resource "aws_s3_bucket" "pitbull" {
  bucket = "pitbull"

  tags = {
    Name = "pitbull"
  }
}

# Keep the bucket private
resource "aws_s3_bucket_public_access_block" "pitbull" {
  bucket = aws_s3_bucket.pitbull.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "bucket_name" {
  value = aws_s3_bucket.pitbull.id
}

output "bucket_arn" {
  value = aws_s3_bucket.pitbull.arn
}
