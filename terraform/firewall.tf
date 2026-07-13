resource "digitalocean_firewall" "core" {
  name = "core-fw"

  droplet_ids = [
    digitalocean_droplet.jira.id,
    digitalocean_droplet.project.id,
  ]

  # SSH allowed from anywhere for now (key-only + fail2ban + non-root already
  # enforced by cloud-init). Once Headscale/Tailscale is joined on each
  # droplet, tighten source_addresses to ["100.64.0.0/10"] and drop this
  # open rule so SSH is reachable only over the tailnet.
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Headscale control-plane endpoint (HTTPS) needs to stay reachable from the
  # public internet so Tailscale clients anywhere can log in.
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
