data "aws_ami" "kafka" {
  most_recent = true

  filter {
    name   = "name"
    values = [local.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [format("ec2.%s", data.aws_partition.current.dns_suffix)]
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "lo-mgr"
    key    = "vpc"
    region = "eu-central-1"
  }
}

data "terraform_remote_state" "zookeeper" {
  backend = "s3"
  config = {
    bucket = "lo-mgr"
    key    = "zookeeper"
    region = "eu-central-1"
  }
}
