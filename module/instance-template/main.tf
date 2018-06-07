# ---------------------------------------------------------------------------------------------------------------------
# Instance Template
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_instance_template" "instance_template" {
  name           = "${var.template_name}"
  machine_type   = "${var.machine_type}"
  can_ip_forward = false

  tags = "${var.tags}"

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "${var.source_image}"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    #network = "${var.vpc_network}"
    subnetwork = "${var.vpc_subnetwork}"
  }

  lifecycle {
    create_before_destroy = true
  }

  service_account {
    scopes = "${var.service_account}"
  }
}
