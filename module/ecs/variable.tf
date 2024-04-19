variable "vpc_id" {
  description = "VPC ID"
}

variable "subnets" {
  description = "Subnets"
}

variable "ecr_repository_url" {
  description = "ECR Repository URL"
}

variable "container_port" {
  description = "Container port"
}

variable "name_prefix" {
  description = "Prefix for the name of the resources"
}

variable "env" {
  description = "Environment for the resources"
}