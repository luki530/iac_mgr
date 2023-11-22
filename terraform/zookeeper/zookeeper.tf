resource "aws_ebs_volume" "ebs_zookeeper" {
  count             = var.zookeeper_node_count
  availability_zone = element(local.azs, count.index)
  size              = 10
  type              = "gp3"
}

resource "aws_network_interface" "zoo" {
  count           = var.zookeeper_node_count
  subnet_id       = element(local.zookeeper_subnet_ids, count.index)
  security_groups = [aws_security_group.zookeeper.id]
}

resource "aws_instance" "zookeeper" {
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  count                = var.zookeeper_node_count
  ami                  = data.aws_ami.zookeeper.id
  instance_type        = var.zookeeper_instance_type
  availability_zone    = element(local.azs, count.index)
  key_name             = "LO"

  user_data = local.zookeeper_userdata[count.index]

  network_interface {
    network_interface_id = element(aws_network_interface.zoo.*.id, count.index)
    device_index         = 0
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  tags = {
    Name = format("zookeeper-%s", count.index + 1)
  }
}

resource "aws_volume_attachment" "zookeeper_data" {
  count        = var.zookeeper_node_count
  device_name  = "/dev/xvdh"
  volume_id    = element(aws_ebs_volume.ebs_zookeeper.*.id, count.index)
  instance_id  = element(aws_instance.zookeeper.*.id, count.index)
  skip_destroy = true
  force_detach = true
}
