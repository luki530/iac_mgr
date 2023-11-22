provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "lo-mgr"
    key            = "vpc"
    region         = "eu-central-1"
    dynamodb_table = "lo-mgr-terraform-state-lock"
  }
}
