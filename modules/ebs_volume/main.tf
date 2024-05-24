resource "aws_ebs_volume" "this" {
  count = length(var.ebs_volumes)

  availability_zone = var.availability_zone
  size              = var.ebs_volumes[count.index].size
  type              = var.ebs_volumes[count.index].type

  tags = merge(var.tags, {
    Name = "ebs-${count.index}"
  })
}
