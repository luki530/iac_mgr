#cloud-config

fqdn: ${agentFqdn}
hostname: ${agentHostname}
manage_etc_hosts: true

write_files:
- path: /tmp/setup_kafka.sh
  permissions: '0755'
  content: |
    #!/bin/bash

    set -e
    set -x

    export host="${agentHostname}"
    export fqdn="${agentFqdn}"

    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    AGENT_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)
    echo "$AGENT_IP $fqdn" >> /etc/hosts


    # for kafka server.properties
    export KAFKA_BROKER_ID=${broker_id}
    export KAFKA_BROKER_RACK=${az}
    export KAFKA_REPLICA_SELECTOR_CLASS=${kafka_replica_selector_class}
    export ZOOKEEPER_CONNECTION_STRING=${zookeeper_connection_string}
    export KAFKA_ADVERTISED_LISTENER=${kafka_advertised_listener}
    export KAFKA_DELETE_TOPIC_ENABLE=${kafka_delete_topic_enable}
    export KAFKA_SOCKET_SEND_BUFFER_BYTES=${kafka_socket_send_buffer_bytes}
    export KAFKA_SOCKET_RECEIVE_BUFFER_BYTES=${kafka_socket_receive_buffer_bytes}
    export KAFKA_SOCKET_REQUEST_MAX_BYTES=${kafka_socket_request_max_bytes}
    export KAFKA_LOG_DIRS=${kafka_log_dirs}
    export KAFKA_LOGS_DIR=${kafka_logs_dir}
    export KAFKA_NUM_PARTITIONS=${kafka_num_partitions}
    export KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR=${kafka_num_recovery_threads_per_data_dir}
    export KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=${kafka_offsets_topic_replication_factor}
    export KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=${kafka_transaction_state_log_replication_factor}
    export KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=${kafka_transaction_state_log_min_isr}
    export KAFKA_LOG_FLUSH_INTERVAL_MESSAGES=${kafka_log_flush_interval_messages}
    export KAFKA_LOG_FLUSH_INTERVAL_MS=${kafka_log_flush_interval_ms}
    export KAFKA_LOG_RETENTION_HOURS=${kafka_log_retention_hours}
    export KAFKA_LOG_SEGMENT_BYTES=${kafka_log_segment_bytes}
    export KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS=${kafka_log_retention_check_interval_ms}
    export KAFKA_LOG_ROLL_HOURS=${kafka_log_roll_hours}
    export KAFKA_OFFSETS_RETENTION_MINUTES=${kafka_offsets_retention_minutes}
    export KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS=${kafka_zookeeper_connection_timeout_ms}
    export KAFKA_DEFAULT_REPLICATION_FACTOR=${kafka_default_replication_factor}
    export KAFKA_AUTO_LEADER_REBALANCE_ENABLE=${kafka_auto_leader_rebalance_enable}
    export KAFKA_BACKGROUND_THREADS=${kafka_background_threads}
    export KAFKA_MIN_INSYNC_REPLICAS=${kafka_min_insync_replicas}
    export KAFKA_NUM_IO_THREADS=${kafka_num_io_threads}
    export KAFKA_NUM_NETWORK_THREADS=${kafka_num_network_threads}
    export KAFKA_NUM_REPLICA_FETCHERS=${kafka_num_replica_fetchers}
    export KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS=${kafka_replica_high_watermark_checkpoint_interval_ms}
    export KAFKA_REPLICA_LAG_TIME_MAX_MS=${kafka_replica_lag_time_max_ms}
    export KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE=${kafka_unclean_leader_election_enable}
    export KAFKA_BROKER_ID_GENERATION_ENABLE=${kafka_broker_id_generation_enable}
    export KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES=${kafka_controlled_shutdown_max_retries}
    export KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=${kafka_group_initial_rebalance_delay_ms}
    export KAFKA_ZOOKEEPER_SYNC_TIME_MS=${kafka_zookeeper_sync_time_ms}
    export KAFKA_INTER_BROKER_PROTOCOL_VERSION=${kafka_inter_broker_protocol_version}
    export KAFKA_LOG_MESSAGE_FORMAT_VERSION=${kafka_log_message_format_version}

    ######################################### Envs for /etc/default/kafka
    export KAFKA_OPTS="${kafka_opts}"
    export KAFKA_JMX_OPTS="${kafka_jmx_opts}"
    export KAFKA_HEAP_OPTS="${kafka_heap_opts}"
    export JMX_PORT="${jmx_port}"
    export KAFKA_GC_LOG_OPTS="${kafka_gc_log_opts}"


    envsubst < ${kafka_bin_dir}/config/server.properties.temp.env > ${kafka_bin_dir}/config/server.properties
    envsubst < ${kafka_bin_dir}/config/log4j.properties.temp.env > ${kafka_bin_dir}/config/log4j.properties

runcmd:
- prepare_storage "${kafka_log_dirs}" "kafka" "kafka"
- rm -rf ${kafka_log_dirs}/lost+found
- /tmp/setup_kafka.sh
- /usr/sbin/enable_and_start_service kafka.service
