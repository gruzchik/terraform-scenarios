locals {
  terraform_state_bucket_and_table_name = "ecs-cloudx-terraform-state"
}

resource "aws_dynamodb_table" "remote_state_lock_table" {
  name         = "${local.terraform_state_bucket_and_table_name}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "remote_state_s3_bucket" {
  bucket        = "${local.terraform_state_bucket_and_table_name}"
  force_destroy = true

  versioning {
    enabled = true
  }
}
