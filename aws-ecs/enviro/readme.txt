# AWS ECR connection
1. Build docker image from Dockerfile:

docker build --file Dockerfile --rm --tag {account_id}.dkr.ecr.{region}.amazonaws.com/nginx-web-app:nginx .

2. Retrieve an authentication token and authenticate for Docker client to AWS ECR registry:

aws ecr get-login-password --region {region} | docker login --username AWS --password-stdin {account_id}.dkr.ecr.{region}.amazonaws.com

3. Push image to the AWS ECR aws_ecr_repository

docker push {account_id}.dkr.ecr.{region}.amazonaws.com/nginx-web-app:nginx

# AWS ECS creation
# Documantation URL: https://www.architect.io/blog/terraform-aws-ecs
