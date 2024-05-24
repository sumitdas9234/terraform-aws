resource "random_id" "id" {
  byte_length = 6
}

resource "aws_network_interface" "enis" {
  count           = var.instance_count
  subnet_id       = var.subnet_id
  security_groups = var.security_group_ids
}

resource "aws_iam_instance_profile" "profile" {
  name = "instance-profile-${random_id.id.hex}"
  role = var.iam_role_name
}

resource "aws_instance" "this" {
  count                = var.instance_count
  ami                  = var.ami_id != "" || length(data.aws_ami.custom) > 0 ? data.aws_ami.custom[0].id : data.aws_ami.latest.id
  instance_type        = local.selected_instance_type
  iam_instance_profile = aws_iam_instance_profile.profile.name
  monitoring           = var.enable_monitoring
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.enis[count.index].id
  }

  tags = merge(var.tags, {
    Name = "${random_id.id.hex}-instance-${count.index}"
  })

  dynamic "ebs_block_device" {
    for_each = var.ebs_volumes
    content {
      device_name = "/dev/sd${ebs_block_device.value.mount_point}"
      volume_size = ebs_block_device.value.size
      volume_type = ebs_block_device.value.type
    }
  }
}
