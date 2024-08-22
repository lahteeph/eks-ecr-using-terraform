provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = [module.vpc.private_subnet_id]
  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_size
      min_capacity     = var.min_size
      max_capacity     = var.max_size
      instance_type    = var.instance_type
      key_name         = var.ssh_key_name
    }
  }

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = false
}

resource "aws_key_pair" "dispoze_ssh-key" {
  key_name   = var.ssh_key_name
  public_key = file(var.ssh_public_key_path)
}
