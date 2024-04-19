module "vpc" {
  source = "../module/vpc"
}

module "ecr" {
  source = "../module/ecr"
  name_prefix = var.name_prefix
  env = var.env
}

module "ecs" {
  source = "../module/ecs"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.subnets
  ecr_repository_url = module.ecr.ecr_repository_url
  container_port = var.container_port
  name_prefix = var.name_prefix
  env = var.env
}

module "rds" {
  source = "../module/rds"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.subnets
  name_prefix = var.name_prefix
  env = var.env
}

module "api_gateway" {
  source = "../module/api-gateway"
  name_prefix = var.name_prefix
  env = var.env
}