output "cluster_endpoint" {
  description = "EKS control plane endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "configure_kubectl" {
  description = "Command to configure kubectl"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.main.name}"
}
output "vpc_id" {
description = "VPC ID for the EKS cluster"                                                                                                         
value       = aws_vpc.main.id
}
output "alb_controller_role_arn" {
  description = "IRSA role ARN for the AWS Load Balancer Controller"
  value       = aws_iam_role.alb_controller.arn
}
output "annotate_alb_controller_sa_command" {
  description = "Ready-to-run command to annotate the AWS LB Controller ServiceAccount"
  value       = "kubectl annotate sa aws-load-balancer-controller -n kube-system eks.amazonaws.com/role-arn=${aws_iam_role.alb_controller.arn} --overwrite"
}
