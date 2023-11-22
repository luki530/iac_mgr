output "zookeepers_ips" {
  value = local.ips
}
output "sg_id" {
  value = aws_security_group.zookeeper.id
}
