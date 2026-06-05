variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "eks-dep"
}

variable "allowed_public_cidrs" {
  description = "CIDR blocks allowed to access EKS public endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}


