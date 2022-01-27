# Make sure you grab a vault token

# Leverage TFC for state management and run execution  
terraform {
  #   cloud {
  #     organization = "<org>"
  # 
  #     workspaces {
  #       name = "<workspace>"
  #     }
  #   }


  # HCP Provider: Create and configure an HCP Vault cluster
  # Vault Provider: Administration of HCP Vault Cluster for secrets management
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.22.0"
    }
  }
}

# Configure the providers
provider "hcp" {
}

# HashiCorp Virtual Network - Required for Vault Cluster
# Manually created and then imported into the Vault Admin's State file  `terraform import hcp_hvn.hvn hvn`
resource "hcp_hvn" "hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.hvn_cloud_provider
  region         = var.hvn_cloud_provider_region
  cidr_block     = var.hvn_cidr_block
}

# HCP Vault Cluster - Provision a small Vault Dev Cluster
# It takes minutes to spin-up a dev cluster and a dev cluster is $0.03/hr.  
resource "hcp_vault_cluster" "vault_cluster" {
  cluster_id      = var.vault_cluster_id
  hvn_id          = hcp_hvn.hvn.hvn_id
  public_endpoint = var.vault_cluster_public_endpoint
  tier            = var.vault_cluster_tier
}

# HCP Vault Admin Token 
resource "hcp_vault_cluster_admin_token" "vault_admin_token" {
  cluster_id = hcp_vault_cluster.vault_cluster.cluster_id
}
