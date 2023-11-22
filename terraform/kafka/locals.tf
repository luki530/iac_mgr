locals {
  zookeepers_ips   = data.terraform_remote_state.zookeeper.outputs.zookeepers_ips
  zookeeper_sg_id  = data.terraform_remote_state.zookeeper.outputs.sg_id
  azs              = data.terraform_remote_state.vpc.outputs.availability_zones
  ami_name         = "kafka-${var.ami_tag}"
  kafka_subnet_ids = data.terraform_remote_state.vpc.outputs.kafka_subnets_ids
}
