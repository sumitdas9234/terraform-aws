module "iam_role" {
  source = ".//modules/iam_role"
  tags   = var.tags
}

module "security_group" {
  source          = ".//modules/security_group"
  vpc_id          = var.vpc_id
  security_groups = var.security_groups
}

module "ec2_instance" {
  source             = ".//modules/ec2_instance"
  instance_count     = var.instance_count
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = var.subnet_id
  security_group_ids = module.security_group.security_group_ids
  iam_role_name      = module.iam_role.iam_role_name
  ebs_volumes        = var.ebs_volumes
  enable_monitoring  = var.enable_monitoring
  region             = var.region
  tags               = var.tags
}
