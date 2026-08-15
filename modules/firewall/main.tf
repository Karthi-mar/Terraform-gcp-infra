resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.firewall_prefix}-allow-ssh"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_range
  target_tags   = var.target_tags
}

resource "google_compute_firewall" "allow_http" {
  name    = "${var.firewall_prefix}-allow-http"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.target_tags
}
