locals {
  zookeeper_nodes = [for i in range(1, var.zookeeper_node_count + 1) :
    format("server.%d=%s-%d.%s:2888:3888", i, var.zookeeper_name, i, var.int_domain_name)
  ]
  zookeeper_subnet_ids = data.terraform_remote_state.vpc.outputs.zookeeper_subnets_ids
  ami_name             = "zookeeper-${var.ami_tag}"
  azs                  = data.terraform_remote_state.vpc.outputs.availability_zones
  ips                  = [for eni in aws_network_interface.zoo : eni.private_ip]
  
  zookeeper_userdata = [for n in range(1, var.zookeeper_node_count + 1) :
    templatefile("templates/zookeeper_userdata.tpl",
      {
        agentHostname   = format("%s-%s", var.zookeeper_name, n)
        agentFqdn       = format("%s-%s.%s", var.zookeeper_name, n, var.int_domain_name)
        agentDomain     = var.int_domain_name
        region          = var.aws_region
        domain          = var.int_domain_name
        hostname        = format("%s-%s", var.zookeeper_name, n)
        max_heap_size   = var.max_heap_size
        zookeeper_id    = n
        zookeeper_nodes = local.zookeeper_nodes
    })
  ]
}
