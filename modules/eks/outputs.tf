output "cluster_name" {
  value       = aws_eks_cluster.this.name
  description = "Name of the EKS cluster."
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "API endpoint of the EKS cluster."
}

output "node_group_arn" {
  value       = aws_eks_node_group.this.arn
  description = "ARN of the node group."
}
