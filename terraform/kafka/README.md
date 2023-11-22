## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.26.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.kafka_ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.kafka-broker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface.kafka_eni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_route53_record.kafka](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.kafka_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.kafka](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.kafka_allow_egress_to_kafka_brokers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.kafka_allow_egress_to_zookeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.kafka_allow_ingress_from_kafka_brokers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.zookeeper_allow_ingress_from_kafka_brokers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_volume_attachment.kafka_data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_ami.kafka](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_route53_zone.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [template_file.kafka_userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.zookeeper](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_tag"></a> [ami\_tag](#input\_ami\_tag) | n/a | `string` | `"rc34"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-central-1"` | no |
| <a name="input_int_domain_name"></a> [int\_domain\_name](#input\_int\_domain\_name) | n/a | `string` | `"mgr.oszczypala.com"` | no |
| <a name="input_jmx_port"></a> [jmx\_port](#input\_jmx\_port) | n/a | `string` | `"9999"` | no |
| <a name="input_kafka_advertised_listener_domain_name"></a> [kafka\_advertised\_listener\_domain\_name](#input\_kafka\_advertised\_listener\_domain\_name) | n/a | `string` | `"mgr.oszczypala.com"` | no |
| <a name="input_kafka_auto_leader_rebalance_enable"></a> [kafka\_auto\_leader\_rebalance\_enable](#input\_kafka\_auto\_leader\_rebalance\_enable) | n/a | `string` | `"true"` | no |
| <a name="input_kafka_background_threads"></a> [kafka\_background\_threads](#input\_kafka\_background\_threads) | n/a | `string` | `"10"` | no |
| <a name="input_kafka_bin_dir"></a> [kafka\_bin\_dir](#input\_kafka\_bin\_dir) | n/a | `string` | `"/opt/kafka"` | no |
| <a name="input_kafka_broker_count"></a> [kafka\_broker\_count](#input\_kafka\_broker\_count) | n/a | `string` | `"3"` | no |
| <a name="input_kafka_broker_id_generation_enable"></a> [kafka\_broker\_id\_generation\_enable](#input\_kafka\_broker\_id\_generation\_enable) | n/a | `string` | `"false"` | no |
| <a name="input_kafka_broker_instance_type"></a> [kafka\_broker\_instance\_type](#input\_kafka\_broker\_instance\_type) | n/a | `string` | `"m5.large"` | no |
| <a name="input_kafka_controlled_shutdown_max_retries"></a> [kafka\_controlled\_shutdown\_max\_retries](#input\_kafka\_controlled\_shutdown\_max\_retries) | n/a | `string` | `"6"` | no |
| <a name="input_kafka_default_replication_factor"></a> [kafka\_default\_replication\_factor](#input\_kafka\_default\_replication\_factor) | n/a | `string` | `"3"` | no |
| <a name="input_kafka_delete_topic_enable"></a> [kafka\_delete\_topic\_enable](#input\_kafka\_delete\_topic\_enable) | n/a | `string` | `"true"` | no |
| <a name="input_kafka_ebs_size"></a> [kafka\_ebs\_size](#input\_kafka\_ebs\_size) | n/a | `string` | `"200"` | no |
| <a name="input_kafka_ebs_type"></a> [kafka\_ebs\_type](#input\_kafka\_ebs\_type) | n/a | `string` | `"gp3"` | no |
| <a name="input_kafka_ec2_identifier"></a> [kafka\_ec2\_identifier](#input\_kafka\_ec2\_identifier) | n/a | `string` | `"kafka"` | no |
| <a name="input_kafka_gc_log_opts"></a> [kafka\_gc\_log\_opts](#input\_kafka\_gc\_log\_opts) | n/a | `string` | `""` | no |
| <a name="input_kafka_group_initial_rebalance_delay_ms"></a> [kafka\_group\_initial\_rebalance\_delay\_ms](#input\_kafka\_group\_initial\_rebalance\_delay\_ms) | n/a | `string` | `"3000"` | no |
| <a name="input_kafka_heap_opts"></a> [kafka\_heap\_opts](#input\_kafka\_heap\_opts) | n/a | `string` | `"-Xmx6G -Xms6G"` | no |
| <a name="input_kafka_inter_broker_protocol_version"></a> [kafka\_inter\_broker\_protocol\_version](#input\_kafka\_inter\_broker\_protocol\_version) | n/a | `string` | `"3.5"` | no |
| <a name="input_kafka_jmx_opts"></a> [kafka\_jmx\_opts](#input\_kafka\_jmx\_opts) | n/a | `string` | `"-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=localhost -Djava.net.preferIPv4Stack=true"` | no |
| <a name="input_kafka_log_dirs"></a> [kafka\_log\_dirs](#input\_kafka\_log\_dirs) | n/a | `string` | `"/opt/kafka/data"` | no |
| <a name="input_kafka_log_flush_interval_messages"></a> [kafka\_log\_flush\_interval\_messages](#input\_kafka\_log\_flush\_interval\_messages) | n/a | `string` | `"10000"` | no |
| <a name="input_kafka_log_flush_interval_ms"></a> [kafka\_log\_flush\_interval\_ms](#input\_kafka\_log\_flush\_interval\_ms) | n/a | `string` | `"200"` | no |
| <a name="input_kafka_log_message_format_version"></a> [kafka\_log\_message\_format\_version](#input\_kafka\_log\_message\_format\_version) | n/a | `string` | `"3.5"` | no |
| <a name="input_kafka_log_retention_check_interval_ms"></a> [kafka\_log\_retention\_check\_interval\_ms](#input\_kafka\_log\_retention\_check\_interval\_ms) | n/a | `string` | `"300000"` | no |
| <a name="input_kafka_log_retention_hours"></a> [kafka\_log\_retention\_hours](#input\_kafka\_log\_retention\_hours) | n/a | `string` | `"168"` | no |
| <a name="input_kafka_log_roll_hours"></a> [kafka\_log\_roll\_hours](#input\_kafka\_log\_roll\_hours) | n/a | `string` | `"24"` | no |
| <a name="input_kafka_log_segment_bytes"></a> [kafka\_log\_segment\_bytes](#input\_kafka\_log\_segment\_bytes) | n/a | `string` | `"1073741824"` | no |
| <a name="input_kafka_logs_dir"></a> [kafka\_logs\_dir](#input\_kafka\_logs\_dir) | n/a | `string` | `"/var/log/kafka"` | no |
| <a name="input_kafka_min_insync_replicas"></a> [kafka\_min\_insync\_replicas](#input\_kafka\_min\_insync\_replicas) | n/a | `string` | `"2"` | no |
| <a name="input_kafka_num_io_threads"></a> [kafka\_num\_io\_threads](#input\_kafka\_num\_io\_threads) | n/a | `string` | `"8"` | no |
| <a name="input_kafka_num_network_threads"></a> [kafka\_num\_network\_threads](#input\_kafka\_num\_network\_threads) | n/a | `string` | `"3"` | no |
| <a name="input_kafka_num_partitions"></a> [kafka\_num\_partitions](#input\_kafka\_num\_partitions) | n/a | `string` | `"45"` | no |
| <a name="input_kafka_num_recovery_threads_per_data_dir"></a> [kafka\_num\_recovery\_threads\_per\_data\_dir](#input\_kafka\_num\_recovery\_threads\_per\_data\_dir) | n/a | `string` | `"1"` | no |
| <a name="input_kafka_num_replica_fetchers"></a> [kafka\_num\_replica\_fetchers](#input\_kafka\_num\_replica\_fetchers) | n/a | `string` | `"1"` | no |
| <a name="input_kafka_offsets_retention_minutes"></a> [kafka\_offsets\_retention\_minutes](#input\_kafka\_offsets\_retention\_minutes) | n/a | `string` | `"43200"` | no |
| <a name="input_kafka_offsets_topic_replication_factor"></a> [kafka\_offsets\_topic\_replication\_factor](#input\_kafka\_offsets\_topic\_replication\_factor) | n/a | `string` | `"3"` | no |
| <a name="input_kafka_opts"></a> [kafka\_opts](#input\_kafka\_opts) | n/a | `string` | `"-javaagent:/opt/jolokia/jolokia-agent.jar=port=8778,host=*"` | no |
| <a name="input_kafka_replica_high_watermark_checkpoint_interval_ms"></a> [kafka\_replica\_high\_watermark\_checkpoint\_interval\_ms](#input\_kafka\_replica\_high\_watermark\_checkpoint\_interval\_ms) | n/a | `string` | `"5000"` | no |
| <a name="input_kafka_replica_lag_time_max_ms"></a> [kafka\_replica\_lag\_time\_max\_ms](#input\_kafka\_replica\_lag\_time\_max\_ms) | n/a | `string` | `"10000"` | no |
| <a name="input_kafka_replica_selector_class"></a> [kafka\_replica\_selector\_class](#input\_kafka\_replica\_selector\_class) | n/a | `string` | `"org.apache.kafka.common.replica.RackAwareReplicaSelector"` | no |
| <a name="input_kafka_socket_receive_buffer_bytes"></a> [kafka\_socket\_receive\_buffer\_bytes](#input\_kafka\_socket\_receive\_buffer\_bytes) | n/a | `string` | `"102400"` | no |
| <a name="input_kafka_socket_request_max_bytes"></a> [kafka\_socket\_request\_max\_bytes](#input\_kafka\_socket\_request\_max\_bytes) | n/a | `string` | `"104857600"` | no |
| <a name="input_kafka_socket_send_buffer_bytes"></a> [kafka\_socket\_send\_buffer\_bytes](#input\_kafka\_socket\_send\_buffer\_bytes) | n/a | `string` | `"102400"` | no |
| <a name="input_kafka_transaction_state_log_min_isr"></a> [kafka\_transaction\_state\_log\_min\_isr](#input\_kafka\_transaction\_state\_log\_min\_isr) | n/a | `string` | `"2"` | no |
| <a name="input_kafka_transaction_state_log_replication_factor"></a> [kafka\_transaction\_state\_log\_replication\_factor](#input\_kafka\_transaction\_state\_log\_replication\_factor) | n/a | `string` | `"3"` | no |
| <a name="input_kafka_unclean_leader_election_enable"></a> [kafka\_unclean\_leader\_election\_enable](#input\_kafka\_unclean\_leader\_election\_enable) | n/a | `string` | `"false"` | no |
| <a name="input_kafka_zookeeper_connection_timeout_ms"></a> [kafka\_zookeeper\_connection\_timeout\_ms](#input\_kafka\_zookeeper\_connection\_timeout\_ms) | n/a | `string` | `"6000"` | no |
| <a name="input_kafka_zookeeper_sync_time_ms"></a> [kafka\_zookeeper\_sync\_time\_ms](#input\_kafka\_zookeeper\_sync\_time\_ms) | n/a | `string` | `"2000"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | n/a | `string` | `"kafka"` | no |

## Outputs

No outputs.
