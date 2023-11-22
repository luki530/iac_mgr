resource "aws_security_group" "kafka" {
  name   = var.security_group_name
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_security_group_rule" "kafka_allow_ingress_from_kafka_brokers" {
  type              = "ingress"
  from_port         = 9092
  to_port           = 9092
  protocol          = "tcp"
  security_group_id = aws_security_group.kafka.id
  self              = true
  description       = "Allow ingress from other Kafka brokers"
}

resource "aws_security_group_rule" "kafka_allow_egress_to_kafka_brokers" {
  type              = "egress"
  from_port         = 9092
  to_port           = 9092
  protocol          = "tcp"
  security_group_id = aws_security_group.kafka.id
  self              = true
  description       = "Allow egress from other Kafka brokers"
}

resource "aws_security_group_rule" "zookeeper_allow_ingress_from_kafka_brokers" {
  type                     = "ingress"
  from_port                = 2181
  to_port                  = 2181
  protocol                 = "tcp"
  security_group_id        = local.zookeeper_sg_id
  source_security_group_id = aws_security_group.kafka.id
  description              = "Allow ingress in Zookeeper from Kafka brokers"
}

resource "aws_security_group_rule" "kafka_allow_egress_to_zookeeper" {
  type                     = "egress"
  from_port                = 2181
  to_port                  = 2181
  protocol                 = "tcp"
  security_group_id        = aws_security_group.kafka.id
  source_security_group_id = local.zookeeper_sg_id
  description              = "Allow egress for Kafka brokers to zookeeper"
}
