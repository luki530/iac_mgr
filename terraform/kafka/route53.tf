data "aws_route53_zone" "internal" {
  name         = var.int_domain_name
  private_zone = true
}

resource "aws_route53_record" "kafka_endpoint" {
  name    = var.kafka_ec2_identifier
  type    = "A"
  zone_id = data.aws_route53_zone.internal.id
  records = aws_instance.kafka-broker[*].private_ip
  ttl     = "60"
}

resource "aws_route53_record" "kafka" {
  count   = var.kafka_broker_count
  name    = format("%s-%s", var.kafka_ec2_identifier, count.index + 1)
  type    = "A"
  zone_id = data.aws_route53_zone.internal.id
  records = [element(aws_instance.kafka-broker[*].private_ip, count.index)]
  ttl     = "60"
}
