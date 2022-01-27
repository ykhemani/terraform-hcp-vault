output "Vault_URL" {
  value = hcp_vault_cluster.vault_cluster.vault_public_endpoint_url
}

output "Vault_Admin_Token" {
  value     = hcp_vault_cluster_admin_token.vault_admin_token.token
  sensitive = true
}

output "Vault_Path_DemoNamespace" {
  value = vault_namespace.DemoNamespace.path
}


