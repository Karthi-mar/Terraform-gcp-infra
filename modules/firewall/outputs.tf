output "ssh_firewall_name" {
  description = " Name of the ssh firewall rule"
  value       = google_compute_firewall.allow_ssh.name
}

output "http_firewall_name" {
  description = "Name of the http firewall rule"
  value       = google_compute_firewall.allow_http.name
}