terraform {
  backend "s3" {
    profile        = "aws_experiments"
    bucket         = "ecs-cloudx-terraform-state"
    key            = "ecs-cloudx.tfstate"
    region         = "us-east-1"
    dynamodb_table = "efs-cloudx-terraform-state"
  }
}
