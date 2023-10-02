terraform {
  backend "s3" {
    profile        = "aws_experiments"
    bucket         = "module-structure-cloudx-terraform-state"
    key            = "module-structure-cloudx.tfstate"
    region         = "us-east-1"
    dynamodb_table = "module-structure-cloudx-terraform-state"
  }
}
