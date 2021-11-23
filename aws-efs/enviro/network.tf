resource "aws_vpc" "default-engx-env" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Engx VPC"
  }
}

resource "aws_subnet" "subnet-efs-us-east-1a" {
  cidr_block        = "${cidrsubnet(aws_vpc.default-engx-env.cidr_block, 8, 1)}"
  vpc_id            = "${aws_vpc.default-engx-env.id}"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet-efs-us-east-1b" {
  cidr_block        = "${cidrsubnet(aws_vpc.default-engx-env.cidr_block, 8, 2)}"
  vpc_id            = "${aws_vpc.default-engx-env.id}"
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "subnet-efs-us-east-1c" {
  cidr_block        = "${cidrsubnet(aws_vpc.default-engx-env.cidr_block, 8, 3)}"
  vpc_id            = "${aws_vpc.default-engx-env.id}"
  availability_zone = "us-east-1c"
}
