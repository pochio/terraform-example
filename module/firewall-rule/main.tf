
resource "google_compute_firewall" "default-allow-http" {
  name    = "${var.fw_rule_prefix}-allow-http"
  network = "${var.vpc_network}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = ["${var.fw_rule_prefix}-http-server"]
}

resource "google_compute_firewall" "default-allow-https" {
  name    = "${var.fw_rule_prefix}-allow-https"
  network = "${var.vpc_network}"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["${var.fw_rule_prefix}-https-server"]
}

resource "google_compute_firewall" "default-allow-ssh" {
  name    = "${var.fw_rule_prefix}-allow-ssh"
  network = "${var.vpc_network}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.allow_ip_list}"

  target_tags = ["${var.fw_rule_prefix}-allow-ssh"]
}