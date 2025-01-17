module "basic_create" {
  source = "../../"

  name          = "tardigrade-config-${random_string.this.result}"
  config_bucket = aws_s3_bucket.this.id
}

resource "random_string" "this" {
  length  = 6
  number  = false
  upper   = false
  special = false
}

resource "aws_s3_bucket" "this" {
  bucket        = "tardigrade-config-${random_string.this.result}"
  force_destroy = true
}

data "aws_caller_identity" "current" {}
