output "availability_zones" {
  value = local.azs
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "zookeeper_subnets_ids" {
  value = local.zookeeper_subnets_ids
}
output "kafka_subnets_ids" {
  value = local.kafka_subnets_ids
}
