resource "aws_ecr_repository" "this" {
  name                 = var.repository_name
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = var.lifecycle_policy == "" ? 0 : 1
  repository = aws_ecr_repository.this.name
  policy     = var.lifecycle_policy
}
