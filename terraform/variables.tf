variable "do_token" {
  description = "DigitalOcean API token (set via TF_VAR_do_token env var, do not hardcode)"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region slug"
  type        = string
  default     = "sgp1" # Singapore, closest to VN
}

variable "ssh_key_path" {
  description = "Path to local SSH public key to upload to DigitalOcean"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "jira_droplet_size" {
  description = "Size slug for the Jira droplet"
  type        = string
  default     = "s-2vcpu-4gb" # $32/mo
}

variable "project_droplet_size" {
  description = "Size slug for the second (side-project) droplet"
  type        = string
  default     = "s-1vcpu-2gb" # $16/mo, adjust once the project is decided
}

variable "database_size" {
  description = "Size slug for the managed Postgres cluster"
  type        = string
  default     = "db-s-1vcpu-1gb" # cheapest tier, ~$15/mo
}
