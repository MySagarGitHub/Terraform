provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  force_destroy = true

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
    Name = "Mys3Bucket"
    Environment = var.environment
  }
}

resource "aws_dynamodb_table" "lock_table" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "TerraformLockTable"
    Environment = var.environment
  }
}