
# ---------------------------------------------------------------------------------------------------------------------
# VPC Subnetwork
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_network" "default-vpc-network" {
  name = "${var.vpc_name}"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "default-subnetwork" {
  name          = "${var.subnetwork_name}"
  ip_cidr_range = "${var.subnetwork_cidr}"
  network       = "${google_compute_network.default-vpc-network.self_link}"
  region        = "asia-northeast1"
}
