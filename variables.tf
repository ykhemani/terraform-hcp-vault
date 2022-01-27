variable "hvn_id" {
  type        = string
  description = "HashiCorp Virtual Network"
  default     = "hvn"
}

variable "hvn_cloud_provider" {
  type        = string
  description = "HashiCorp Virtual Network Cloud Provider"
  default     = "aws"
}

variable "hvn_cloud_provider_region" {
  type        = string
  description = "HashiCorp Virtual Network Cloud Provider Region"
  default     = "us-east-1"
}

variable "hvn_cidr_block" {
  type        = string
  description = "HashiCorp Virtual Network CIDR Block"
  default     = "172.25.16.0/20"
}

variable "vault_cluster_id" {
  type        = string
  description = "HCP Vault Cluster ID"
  default     = "vault-cluster"
}

variable "vault_cluster_public_endpoint" {
  type        = bool
  description = "Denotes that the cluster has a public endpoint."
  default     = true
}

variable "vault_cluster_tier" {
  type        = string
  description = "HCP Vault Cluster Tier. One of: dev, standard_small, standard_medium, standard_large, starter_small."
  default     = "dev"
}

variable "vault_cluster_demo_namespace_path" {
  type        = string
  description = "The path of the namespace. Must not have a trailing /."
  default     = "DemoNamespace"
}