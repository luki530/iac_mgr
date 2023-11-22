resource "aws_network_interface" "kafka_eni" {
  count           = var.kafka_broker_count
  subnet_id       = element(local.kafka_subnet_ids, count.index)
  security_groups = [aws_security_group.kafka.id]
}

resource "aws_ebs_volume" "kafka_ebs" {
  count             = var.kafka_broker_count
  availability_zone = element(local.azs, count.index)
  size              = var.kafka_ebs_size
  type              = var.kafka_ebs_type
}

resource "aws_instance" "kafka-broker" {
  count                = var.kafka_broker_count
  ami                  = data.aws_ami.kafka.id
  instance_type        = var.kafka_broker_instance_type
  availability_zone    = element(local.azs, count.index)
  user_data            = data.template_file.kafka_userdata[count.index].rendered
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  key_name             = "LO"

  tags = {
    "Name" = format("kafka-%s", count.index + 1)
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }


  network_interface {
    network_interface_id = element(aws_network_interface.kafka_eni[*].id, count.index)
    device_index         = 0
  }
}

resource "aws_volume_attachment" "kafka_data" {
  count        = var.kafka_broker_count
  device_name  = "/dev/xvdh"
  volume_id    = element(aws_ebs_volume.kafka_ebs[*].id, count.index)
  instance_id  = element(aws_instance.kafka-broker[*].id, count.index)
  skip_destroy = true
  force_detach = true
}

