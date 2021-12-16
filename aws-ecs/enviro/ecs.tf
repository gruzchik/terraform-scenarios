# ecs task definition
resource "aws_ecs_task_definition" "hello_world" {
  family                   = "hello_world"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  # execution_role_arn       = "arn:aws:iam::539954669435:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  execution_role_arn       = "arn:aws:iam::539954669435:role/ecsTaskExecutionRole"

  container_definitions = <<DEFINITION
[
  {
    "image": "539954669435.dkr.ecr.us-east-1.amazonaws.com/ecr-task-pogorelko:cloudx-app",
    "cpu": 256,
    "memory": 512,
    "name": "cloudx-app",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
}

# ecs cluster
resource "aws_ecs_cluster" "main" {
  name = "cloudx-cluster"
}

resource "aws_ecs_service" "hello_world" {
  name            = "cloudx-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.lb.id]
    subnets         = aws_subnet.private.*.id
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.hello_world.id
    container_name   = "cloudx-app"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.hello_world]
}

output "load_balancer_ip" {
  value = aws_lb.default.dns_name
}
