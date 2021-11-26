terraform {
  backend "s3" {
    profile        = "aws_experiments"
    bucket         = "structure-cloudx-terraform-state"
    key            = "structure-cloudx.tfstate"
    region         = "us-east-1"
    dynamodb_table = "structure-cloudx-terraform-state"
  }
}
