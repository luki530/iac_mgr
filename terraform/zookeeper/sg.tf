resource "aws_security_group" "zookeeper" {
  name   = var.security_group_name
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_security_group_rule" "zookeeper_allow_ingress_from_zookeeper_2888" {
  type              = "ingress"
  from_port         = 2888
  to_port           = 2888
  protocol          = "tcp"
  security_group_id = aws_security_group.zookeeper.id
  self              = true
  description       = "Allow ingress from other zk nodes on port 2888"
}

resource "aws_security_group_rule" "zookeeper_allow_ingress_from_zookeeper_3888" {
  type              = "ingress"
  from_port         = 3888
  to_port           = 3888
  protocol          = "tcp"
  security_group_id = aws_security_group.zookeeper.id
  self              = true
  description       = "Allow ingress from other zk nodes on port 3888"
}

resource "aws_security_group_rule" "zookeeper_allow_ingress_from_zookeeper_443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.zookeeper.id
  self              = true
  description       = "Allow ingress from other zk nodes on port 443"
}

resource "aws_security_group_rule" "zookeeper_allow_egress_to_zookeeper_2888" {
  type              = "egress"
  from_port         = 2888
  to_port           = 2888
  protocol          = "tcp"
  security_group_id = aws_security_group.zookeeper.id
  self              = true
  description       = "Allow egress to other zk nodes on port 2888"
}

resource "aws_security_group_rule" "zookeeper_allow_egress_to_zookeeper_3888" {
  type              = "egress"
  from_port         = 3888
  to_port           = 3888
  protocol          = "tcp"
  security_group_id = aws_security_group.zookeeper.id
  self              = true
  description       = "Allow egress to other zk nodes on port 3888"
}
