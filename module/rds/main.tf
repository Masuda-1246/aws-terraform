resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.name_prefix}-db-subnet-group-${var.env}"
  subnet_ids = var.subnets
}

resource "aws_rds_cluster" "cluster" {
  cluster_identifier = "${var.name_prefix}-cluster-${var.env}"
  engine             = "aurora-postgresql"
  engine_version     = "11.7"
  database_name      = "appdb"
  master_username    = "postgres"
  master_password    = "changeMe1234"
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  skip_final_snapshot = true
}
