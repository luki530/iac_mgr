packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

variable "tag" {
  type = string
}

source "amazon-ebs" "zookeeper" {
  ami_name      = "zookeeper-${var.tag}"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
  ssh_username = "ubuntu"
}
build {
  sources = ["source.amazon-ebs.zookeeper"]
  provisioner "ansible" {
    playbook_file = "playbook.yml"
    galaxy_file   = "requirements.yml"
    user          = "ubuntu"
    use_proxy     = false
  }
}
