# ---------------------------------------------------------------------------------------------------------------------
# Instance Template - OUTPUT -
# ---------------------------------------------------------------------------------------------------------------------
output "default-network" {
  value = "${google_compute_network.default-vpc-network.self_link}"
}

output "asia-northeast1-subnetwork" {
  value = "${google_compute_subnetwork.default-subnetwork.self_link}"
}
