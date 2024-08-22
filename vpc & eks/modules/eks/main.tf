module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "19.16.0"
  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  vpc_id                          = var.vpc_id
  subnet_ids                      = [var.private_subnet_id]
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = false

  eks_managed_node_group_defaults = {
    ami_type                   = var.ami_type
    instance_types             = [var.instance_type]
    iam_role_attach_cni_policy = true
    key_name                   = var.key_name
  }
  eks_managed_node_groups = {
    eks_nodes = {
      min_size       = var.min_size
      max_size       = var.max_size
      desired_size   = var.desired_size
      instance_types = var.instance_type
    }
  }
}
