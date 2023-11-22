## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0, <5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.ebs_zookeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.zookeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface.zoo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_route53_record.zookeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.zookeeper_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_security_group.zookeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.zookeeper_allow_egress_to_zookeeper_2888](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.zookeeper_allow_egress_to_zookeeper_3888](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.zookeeper_allow_ingress_from_zookeeper_2888](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.zookeeper_allow_ingress_from_zookeeper_3888](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.zookeeper_allow_ingress_from_zookeeper_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_volume_attachment.zookeeper_data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_ami.zookeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_tag"></a> [ami\_tag](#input\_ami\_tag) | n/a | `string` | `"rc30"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-central-1"` | no |
| <a name="input_int_domain_name"></a> [int\_domain\_name](#input\_int\_domain\_name) | n/a | `string` | `"mgr.oszczypala.com"` | no |
| <a name="input_max_heap_size"></a> [max\_heap\_size](#input\_max\_heap\_size) | n/a | `string` | `"1024m"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | n/a | `string` | `"zookeeper"` | no |
| <a name="input_zookeeper_instance_type"></a> [zookeeper\_instance\_type](#input\_zookeeper\_instance\_type) | n/a | `string` | `"t3a.small"` | no |
| <a name="input_zookeeper_name"></a> [zookeeper\_name](#input\_zookeeper\_name) | n/a | `string` | `"zookeeper"` | no |
| <a name="input_zookeeper_node_count"></a> [zookeeper\_node\_count](#input\_zookeeper\_node\_count) | n/a | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | n/a |
| <a name="output_zookeepers_ips"></a> [zookeepers\_ips](#output\_zookeepers\_ips) | n/a |
