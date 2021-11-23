terraform {
  backend "s3" {
    profile        = "aws_experiments"
    bucket         = "efs-cloudx-terraform-state"
    key            = "efs-cloudx.tfstate"
    region         = "us-east-1"
    dynamodb_table = "efs-cloudx-terraform-state"
  }
}
