resource "aws_vpc" "tf-vpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name  = "tf-vpc-01"
    Stack = "dev-01"
    Owner = "Harry P"
  }
}

resource "aws_subnet" "my-dev-01-sub-pub-a" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "172.16.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "my-dev-01-sub-pub-a"
  }
}

resource "aws_subnet" "my-dev-01-sub-priv-a" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "172.16.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "my-dev-01-sub-priv-a"
  }
}

resource "aws_subnet" "my-dev-01-sub-pub-b" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "172.16.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "my-dev-01-sub-pub-b"
  }
}

resource "aws_subnet" "my-dev-01-sub-priv-b" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "172.16.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "my-dev-01-sub-priv-b"
  }
}

resource "aws_subnet" "my-dev-01-sub-pub-c" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "172.16.5.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "my-dev-01-sub-pub-c"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "172.16.6.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "my-dev-01-sub-priv-c"
  }
}
