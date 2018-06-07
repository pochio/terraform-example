
# ---------------------------------------------------------------------------------------------------------------------
# Instance group, Health check
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_region_instance_group_manager" "region_instance_group_manager" {
  name = "${var.group_name}"

  base_instance_name         = "${var.source_image}"
  instance_template          = "${var.instance_template_link}"
  region                     = "${var.region}"
  distribution_policy_zones  = "${var.zone}"

  target_size  = "${var.target_size}"

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = "${google_compute_health_check.compute_health_check.self_link}"
    initial_delay_sec = 120
  }
}

resource "google_compute_health_check" "compute_health_check" {
  name = "${var.healthcheck_name}"

  timeout_sec         = 10
  check_interval_sec  = 10
  healthy_threshold   = 5
  unhealthy_threshold = 5

  http_health_check {
    request_path = "/"
    port = "80"
  }
}