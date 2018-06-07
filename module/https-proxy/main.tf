# ---------------------------------------------------------------------------------------------------------------------
# HTTPS Proxy
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_target_https_proxy" "target_https_proxy" {
  name             = "${var.proxy_name}"
  url_map          = "${google_compute_url_map.https_url_map.self_link}"
  ssl_certificates = ["${google_compute_ssl_certificate.target_https_proxy_certficate.self_link}"]
}

resource "google_compute_ssl_certificate" "target_https_proxy_certficate" {
  name        = "defailt-ssl-certificate-${random_id.rand.dec}"
  private_key = "${file("private.key")}"
  certificate = "${file("certificate.crt")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "random_id" "rand" {
  byte_length = 11
}

resource "google_compute_url_map" "https_url_map" {
  name = "${var.url_map_name}"

  default_service = "${google_compute_backend_service.https_backend_service.self_link}"

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = "${google_compute_backend_service.https_backend_service.self_link}"

    path_rule {
      paths   = ["/*"]
      service = "${google_compute_backend_service.https_backend_service.self_link}"
    }
  }
}

resource "google_compute_backend_service" "https_backend_service" {
  name        = "${var.proxy_backend_name}"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  enable_cdn  = false

  backend {
    group = "${var.instance_group_link}"
  }

  health_checks = ["${var.healthcheck_link}"]
}

resource "google_compute_global_forwarding_rule" "https_glocal_forwarding_rule" {
  name       = "${var.fowarding-rule}"
  target     = "${google_compute_target_https_proxy.target_https_proxy.self_link}"
  port_range = "443"
}
