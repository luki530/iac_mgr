locals {
  zookeeper_subnets_ids = [
    aws_subnet.zookeeper_a.id,
    aws_subnet.zookeeper_b.id,
    aws_subnet.zookeeper_c.id,
  ]
  kafka_subnets_ids = [
    aws_subnet.kafka_a.id,
    aws_subnet.kafka_b.id,
    aws_subnet.kafka_c.id,
  ]
  azs = sort(data.aws_availability_zones.available.names)
}
