output "jira_ip" {
  description = "Public IPv4 of the Jira droplet"
  value       = digitalocean_droplet.jira.ipv4_address
}

output "project_ip" {
  description = "Public IPv4 of the project droplet"
  value       = digitalocean_droplet.project.ipv4_address
}

output "database_private_uri" {
  description = "Private connection URI for the Postgres cluster (use this from the Jira droplet)"
  value       = digitalocean_database_cluster.postgres.private_uri
  sensitive   = true
}
