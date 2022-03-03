module "modzy" {
  source = "modzy/modzy-env/aws"
  
  version = "1.0.0"

  admin_email = "john.doe@acmecorp.com"

  aws_region = "us-east-1"

  aws_profile = "my-aws-profile"

  installation_identifier = "modzy-install-1"

  fqdn = "modzy.mydomain.com"

  k8s_version = "1.21"

  management_cidrs = [
    "10.x.x.x/x"
  ]

  admin_role_arn = "arn:aws:iam::0123456789:role/RoleName"

  tags = {
    "Customer" = "Acme Corp"
  }

  vpc_id = "vpc-0123456789abcde"

  public_subnets = [
    "subnet-0111111111111111a",
    "subnet-0111111111111111b",
    "subnet-0111111111111111c",
  ]

  platform_subnets = [
    "subnet-0222222222222222a",
    "subnet-0222222222222222b",
    "subnet-0222222222222222c"
  ]

  model_subnets = [
    "subnet-0222222222222222a",
    "subnet-0222222222222222b",
    "subnet-0222222222222222c"
  ]

  db_subnets = [
    "subnet-0333333333333333a",
    "subnet-0333333333333333b",
    "subnet-0333333333333333c"
  ]

  worker_ami_id = "ami-workeramiid123"

  ec2_keypair_name = "modzy-nodes"

  model_node_groups = [
    {
      name = "small-cpu"
      ami_id = "ami-CPUamiid123"
      instance_type = "m5.large"
      asg_desired_capacity = 0
      asg_min_size = 0
      asg_max_size = 3
    },
    {
      name = "medium-cpu"
      ami_id = "ami-CPUamiid123"
      instance_type = "m5.xlarge"
      asg_desired_capacity = 0
      asg_min_size = 0
      asg_max_size = 3
    },
    {
      name = "large-cpu"
      ami_id = "ami-CPUamiid123"
      instance_type = "m5.2xlarge"
      asg_desired_capacity = 0
      asg_min_size = 0
      asg_max_size = 3
    },
    {
      name = "small-gpu"
      ami_id = "ami-GPUamiid123"
      instance_type = "g4dn.xlarge"
      asg_desired_capacity = 0
      asg_min_size = 0
      asg_max_size = 1
    },
    {
      name = "medium-gpu"
      ami_id = "ami-GPUamiid123"
      instance_type = "p2.xlarge"
      asg_desired_capacity = 0
      asg_min_size = 0
      asg_max_size = 1
    }
  ]

}

output "kots_install_cmd" {
  description = "The following command can be used to install Modzy using KOTS."
  value = module.modzy.kots_install_cmd
  sensitive = true
}