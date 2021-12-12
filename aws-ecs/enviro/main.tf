resource "aws_ecr_repository" "nginx-web-app" {
  name                 = "nginx-web-app"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository_policy" "nginx-web-app-repo-policy" {
  repository = aws_ecr_repository.nginx-web-app.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the nginx-web-app repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}
