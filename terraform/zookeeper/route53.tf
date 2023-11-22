resource "aws_route53_zone" "internal" {
  name = var.int_domain_name
  vpc {
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  }
}
resource "aws_route53_record" "zookeeper" {
  count   = var.zookeeper_node_count
  name    = format("%s-%s", var.zookeeper_name, count.index + 1)
  records = [element(aws_instance.zookeeper.*.private_ip, count.index)]
  zone_id = aws_route53_zone.internal.id
  ttl     = "5"
  type    = "A"
}

resource "aws_route53_record" "zookeeper_endpoint" {
  name    = var.zookeeper_name
  type    = "A"
  zone_id = aws_route53_zone.internal.id
  records = aws_instance.zookeeper.*.private_ip
  ttl     = "60"
}
