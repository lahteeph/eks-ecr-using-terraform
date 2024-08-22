variable "aws_region" {
  description = "AWS region where the resources will be deployed"
  type        = string
  default     = "eu-west-1" # You can change this to your preferred region
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "AWS availability zone for the subnets"
  type        = string
  default     = "eu-west-1a" # Change this if necessary
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "dispoze-eks-cluster"
}

variable "cluster_version" {
  description = "Version of EKS"
  type        = string
  default     = "1.26"
}

variable "desired_size" {
  description = "Desired number of instances in the node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of instances in the node group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances in the node group"
  type        = number
  default     = 5
}

variable "instance_type" {
  description = "EC2 instance type for the node group"
  type        = string
  default     = "t3.medium"
}

variable "ssh_key_name" {
  description = "Name of the SSH key to use for EC2 instances"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}
