resource "aws_ecr_repository" "repository" {
  name = "${var.name_prefix}-repository-${var.env}"
}
