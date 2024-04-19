resource "aws_ecs_cluster" "cluster" {
  name = "${var.name_prefix}-cluster-${var.env}"
}

resource "aws_ecs_task_definition" "task" {
  family                   = "app-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512" # 適宜調整
  memory                   = "1024" # 適宜調整

  container_definitions = jsonencode([
    {
      name       = "${var.name_prefix}-container-${var.env}"
      image      = var.ecr_repository_url
      essential  = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/app"
          awslogs-region        = "ap-northeast-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "service" {
  name            = "${var.name_prefix}-service-${var.env}"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    assign_public_ip = true
  }
}
