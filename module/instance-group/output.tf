# ---------------------------------------------------------------------------------------------------------------------
# Instance Group - OUTPUT -
# ---------------------------------------------------------------------------------------------------------------------
output "instance_group_link" {
  value = "${google_compute_region_instance_group_manager.region_instance_group_manager.instance_group}"
}

output "healthcheck_link" {
  value = "${google_compute_health_check.compute_health_check.self_link}"
}
