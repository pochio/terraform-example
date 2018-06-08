# ---------------------------------------------------------------------------------------------------------------------
# Firewall Rule - OUTPUT -
# ---------------------------------------------------------------------------------------------------------------------
output "rules" {
  value = [
    "${google_compute_firewall.default-allow-http.name}",
    "${google_compute_firewall.default-allow-https.name}",
    "${google_compute_firewall.default-allow-ssh.name}"
  ]
}
