variable "aws_region" {
  type    = string
  default = "eu-central-1"
}
variable "int_domain_name" {
  type    = string
  default = "mgr.oszczypala.com"
}
variable "security_group_name" {
  type    = string
  default = "kafka"
}
variable "ami_tag" {
  type    = string
  default = "rc34"
}
variable "kafka_broker_instance_type" {
  type    = string
  default = "m5.large"
}
variable "kafka_ebs_size" {
  type    = string
  default = "200"
}
variable "kafka_ebs_type" {
  type    = string
  default = "gp3"
}
variable "kafka_advertised_listener_domain_name" {
  type    = string
  default = "mgr.oszczypala.com"
}
variable "kafka_broker_count" {
  type    = string
  default = "3"
}
variable "kafka_ec2_identifier" {
  type    = string
  default = "kafka"
}
variable "kafka_delete_topic_enable" {
  type    = string
  default = "true"
}

variable "kafka_socket_send_buffer_bytes" {
  type    = string
  default = "102400"
}

variable "kafka_socket_receive_buffer_bytes" {
  type    = string
  default = "102400"
}

variable "kafka_socket_request_max_bytes" {
  type    = string
  default = "104857600"
}

variable "kafka_log_dirs" {
  type    = string
  default = "/opt/kafka/data"
}

variable "kafka_logs_dir" {
  type    = string
  default = "/var/log/kafka"
}

variable "kafka_bin_dir" {
  type    = string
  default = "/opt/kafka"
}

variable "kafka_num_partitions" {
  type    = string
  default = "45"
}

variable "kafka_num_recovery_threads_per_data_dir" {
  type    = string
  default = "1"
}

variable "kafka_offsets_topic_replication_factor" {
  type    = string
  default = "3"
}

variable "kafka_transaction_state_log_replication_factor" {
  type    = string
  default = "3"
}

variable "kafka_transaction_state_log_min_isr" {
  type    = string
  default = "2"
}

variable "kafka_log_flush_interval_messages" {
  type    = string
  default = "10000"
}

variable "kafka_log_flush_interval_ms" {
  type    = string
  default = "200"
}

variable "kafka_log_retention_hours" {
  type    = string
  default = "168"
}

variable "kafka_log_roll_hours" {
  type    = string
  default = "24"
}

variable "kafka_log_segment_bytes" {
  type    = string
  default = "1073741824"
}

variable "kafka_log_retention_check_interval_ms" {
  type    = string
  default = "300000"
}

variable "kafka_offsets_retention_minutes" {
  type    = string
  default = "43200"
}

variable "kafka_zookeeper_connection_timeout_ms" {
  type    = string
  default = "6000"
}

variable "kafka_default_replication_factor" {
  type    = string
  default = "3"
}

variable "kafka_auto_leader_rebalance_enable" {
  type    = string
  default = "true"
}

variable "kafka_background_threads" {
  type    = string
  default = "10"
}

variable "kafka_min_insync_replicas" {
  type    = string
  default = "2"
}

variable "kafka_num_io_threads" {
  type    = string
  default = "8"
}

variable "kafka_num_network_threads" {
  type    = string
  default = "3"
}

variable "kafka_num_replica_fetchers" {
  type    = string
  default = "1"
}

variable "kafka_replica_high_watermark_checkpoint_interval_ms" {
  type    = string
  default = "5000"
}

variable "kafka_replica_lag_time_max_ms" {
  type    = string
  default = "10000"
}

variable "kafka_unclean_leader_election_enable" {
  type    = string
  default = "false"
}

variable "kafka_broker_id_generation_enable" {
  type    = string
  default = "false"
}

variable "kafka_controlled_shutdown_max_retries" {
  type    = string
  default = "6"
}

variable "kafka_group_initial_rebalance_delay_ms" {
  type    = string
  default = "3000"
}

variable "kafka_zookeeper_sync_time_ms" {
  type    = string
  default = "2000"
}

variable "kafka_inter_broker_protocol_version" {
  type    = string
  default = "3.5"
}

variable "kafka_log_message_format_version" {
  type    = string
  default = "3.5"
}

variable "kafka_heap_opts" {
  type    = string
  default = "-Xmx6G -Xms6G"
}

variable "kafka_gc_log_opts" {
  type    = string
  default = ""
}

variable "kafka_jmx_opts" {
  type    = string
  default = "-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=localhost -Djava.net.preferIPv4Stack=true"
}

variable "kafka_opts" {
  type    = string
  default = "-javaagent:/opt/jolokia/jolokia-agent.jar=port=8778,host=*"
}

variable "jmx_port" {
  type    = string
  default = "9999"
}
variable "kafka_replica_selector_class" {
  type    = string
  default = "org.apache.kafka.common.replica.RackAwareReplicaSelector"
}
