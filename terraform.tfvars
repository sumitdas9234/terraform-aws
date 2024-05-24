# Define the AWS region to deploy resources
region = "us-west-2"

# Define the deployment environment (e.g., dev, prod)
tags = {
  Environment  = "dev"
  Project      = "interview"
  Owner        = "Platform"
  Significance = "critical"
  Impact       = "high"
}

# Network details for the EC2 instances
subnet_id = "subnet-12334"
vpc_id    = "vpc-12334"

# Instances Details
instance_count    = 3
instance_type     = "t2.micro"
enable_monitoring = true

# List of EBS volumes to attach to the instances
ebs_volumes = [
  {
    size        = 4
    type        = "gp2"
    mount_point = "f"
  },
  {
    size        = 8
    type        = "gp2"
    mount_point = "g"
  }
]

# List of Security Groups to attach to each of the instances
security_groups = [
  {
    name        = "web-sg"
    description = "Security group for web servers"
    ingress = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Name = "web-sg"
    }
  },
  {
    name        = "app-sg"
    description = "Security group for application servers"
    ingress = [
      {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Name = "app-sg"
    }
  },
  {
    name        = "db-sg"
    description = "Security group for database servers"
    ingress = [
      {
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Name = "db-sg"
    }
  }
]
