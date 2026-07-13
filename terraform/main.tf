locals {
  ssh_public_key = trimspace(file(pathexpand(var.ssh_key_path)))
}

resource "digitalocean_ssh_key" "default" {
  name       = "terraform-managed-key"
  public_key = local.ssh_public_key
}

resource "digitalocean_droplet" "jira" {
  name       = "jira-server"
  image      = "ubuntu-24-04-x64"
  region     = var.region
  size       = var.jira_droplet_size
  ssh_keys   = [digitalocean_ssh_key.default.fingerprint]
  monitoring = true
  tags       = ["jira"]
  user_data = templatefile("${path.module}/cloud-init/jira.yaml.tftpl", {
    ssh_public_key = local.ssh_public_key
  })
}

resource "digitalocean_droplet" "project" {
  name       = "project-server"
  image      = "ubuntu-24-04-x64"
  region     = var.region
  size       = var.project_droplet_size
  ssh_keys   = [digitalocean_ssh_key.default.fingerprint]
  monitoring = true
  tags       = ["project"]
  user_data = templatefile("${path.module}/cloud-init/project.yaml.tftpl", {
    ssh_public_key = local.ssh_public_key
  })
}
