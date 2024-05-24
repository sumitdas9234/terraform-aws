## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_instance"></a> [ec2\_instance](#module\_ec2\_instance) | .//modules/ec2_instance | n/a |
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | .//modules/iam_role | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | .//modules/security_group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | Custom AMI ID, defaults to Amazon managed AMI if not provided | `string` | `""` | no |
| <a name="input_ebs_volumes"></a> [ebs\_volumes](#input\_ebs\_volumes) | List of EBS volumes to attach | <pre>list(object({<br>    size        = number<br>    type        = string<br>    mount_point = string<br>  }))</pre> | `[]` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Enable detailed monitoring | `bool` | `true` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of EC2 instances | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t2.micro"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy resources | `string` | `"us-east-1"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group definitions | <pre>list(object({<br>    name        = string<br>    description = string<br>    ingress = list(object({<br>      from_port        = number<br>      to_port          = number<br>      protocol         = string<br>      cidr_blocks      = optional(list(string), [])<br>      ipv6_cidr_blocks = optional(list(string), [])<br>    }))<br>    egress = list(object({<br>      from_port        = number<br>      to_port          = number<br>      protocol         = string<br>      cidr_blocks      = optional(list(string), [])<br>      ipv6_cidr_blocks = optional(list(string), [])<br>    }))<br>    tags = optional(map(string), {})<br>  }))</pre> | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for the EC2 instance | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global tags to be applied to all resources | `map(string)` | <pre>{<br>  "Environment": "production",<br>  "Impact": "high",<br>  "Owner": "DevOps Team",<br>  "Project": "my-project",<br>  "Significance": "high"<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | IDs of the created EC2 instances |
| <a name="output_private_ips"></a> [private\_ips](#output\_private\_ips) | Private IPs of the created EC2 instances |
