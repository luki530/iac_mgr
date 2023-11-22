data "template_file" "kafka_userdata" {
  template = file("templates/kafka_userdata.tpl")
  count    = var.kafka_broker_count

  vars = {
    zookeeper_connection_string                         = join(",", local.zookeepers_ips)
    kafka_delete_topic_enable                           = var.kafka_delete_topic_enable
    kafka_socket_send_buffer_bytes                      = var.kafka_socket_send_buffer_bytes
    kafka_socket_receive_buffer_bytes                   = var.kafka_socket_receive_buffer_bytes
    kafka_socket_request_max_bytes                      = var.kafka_socket_request_max_bytes
    kafka_log_dirs                                      = var.kafka_log_dirs
    kafka_logs_dir                                      = var.kafka_logs_dir
    kafka_num_partitions                                = var.kafka_num_partitions
    kafka_num_recovery_threads_per_data_dir             = var.kafka_num_recovery_threads_per_data_dir
    kafka_offsets_topic_replication_factor              = var.kafka_offsets_topic_replication_factor
    kafka_transaction_state_log_replication_factor      = var.kafka_transaction_state_log_replication_factor
    kafka_transaction_state_log_min_isr                 = var.kafka_transaction_state_log_min_isr
    kafka_log_flush_interval_messages                   = var.kafka_log_flush_interval_messages
    kafka_log_flush_interval_ms                         = var.kafka_log_flush_interval_ms
    kafka_log_retention_hours                           = var.kafka_log_retention_hours
    kafka_log_segment_bytes                             = var.kafka_log_segment_bytes
    kafka_log_retention_check_interval_ms               = var.kafka_log_retention_check_interval_ms
    kafka_log_roll_hours                                = var.kafka_log_roll_hours
    kafka_offsets_retention_minutes                     = var.kafka_offsets_retention_minutes
    kafka_zookeeper_connection_timeout_ms               = var.kafka_zookeeper_connection_timeout_ms
    kafka_default_replication_factor                    = var.kafka_default_replication_factor
    kafka_auto_leader_rebalance_enable                  = var.kafka_auto_leader_rebalance_enable
    kafka_background_threads                            = var.kafka_background_threads
    kafka_min_insync_replicas                           = var.kafka_min_insync_replicas
    kafka_num_io_threads                                = var.kafka_num_io_threads
    kafka_num_network_threads                           = var.kafka_num_network_threads
    kafka_num_replica_fetchers                          = var.kafka_num_replica_fetchers
    kafka_replica_high_watermark_checkpoint_interval_ms = var.kafka_replica_high_watermark_checkpoint_interval_ms
    kafka_replica_lag_time_max_ms                       = var.kafka_replica_lag_time_max_ms
    kafka_unclean_leader_election_enable                = var.kafka_unclean_leader_election_enable
    kafka_broker_id_generation_enable                   = var.kafka_broker_id_generation_enable
    kafka_controlled_shutdown_max_retries               = var.kafka_controlled_shutdown_max_retries
    kafka_group_initial_rebalance_delay_ms              = var.kafka_group_initial_rebalance_delay_ms
    kafka_zookeeper_sync_time_ms                        = var.kafka_zookeeper_sync_time_ms
    kafka_inter_broker_protocol_version                 = var.kafka_inter_broker_protocol_version
    kafka_log_message_format_version                    = var.kafka_log_message_format_version
    kafka_advertised_listener                           = format("%s-%s.%s", var.kafka_ec2_identifier, count.index + 1, var.kafka_advertised_listener_domain_name)
    kafka_heap_opts                                     = var.kafka_heap_opts
    kafka_opts                                          = var.kafka_opts
    kafka_jmx_opts                                      = var.kafka_jmx_opts
    jmx_port                                            = var.jmx_port
    kafka_gc_log_opts                                   = format("-Xloggc:%s/kafkaServer-gc.log %s", var.kafka_logs_dir, var.kafka_gc_log_opts)
    az                                                  = element(local.azs, count.index)
    kafka_replica_selector_class                        = var.kafka_replica_selector_class
    kafka_bin_dir                                       = var.kafka_bin_dir
    broker_id                                           = format("1%03s", count.index + 1)
    agentFqdn                                           = format("%s-%s.%s", var.kafka_ec2_identifier, count.index + 1, var.int_domain_name)
    agentHostname                                       = format("%s-%s", var.kafka_ec2_identifier, count.index + 1)
  }
}

