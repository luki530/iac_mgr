variable "aws_region" {
  type    = string
  default = "eu-central-1"
}
variable "int_domain_name" {
  type    = string
  default = "mgr.oszczypala.com"
}
variable "zookeeper_node_count" {
  type    = number
  default = 3
}
variable "zookeeper_name" {
  type    = string
  default = "zookeeper"
}
variable "max_heap_size" {
  type    = string
  default = "1024m"
}
variable "security_group_name" {
  type    = string
  default = "zookeeper"
}
variable "zookeeper_instance_type" {
  type    = string
  default = "t3a.small"
}
variable "ami_tag" {
  type    = string
  default = "rc30"
}
