# ---------------------------------------------------------------------------------------------------------------------
# General Variables
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  default = "asia-northeast1"
}

variable "zone" {
  type    = "list"
  default = ["asia-northeast1-a", "asia-northeast1-b", "asia-northeast1-c"]
}

# ---------------------------------------------------------------------------------------------------------------------
# VPC / Subnetwork
# ---------------------------------------------------------------------------------------------------------------------
variable "vpc_name" {
  default = "default-networks"
}

variable "subnetwork_name" {
  default = "default-subnetwork"
}

variable "subnetwork_cidr" {
  default = "192.168.2.0/24"
}

# ---------------------------------------------------------------------------------------------------------------------
# Firewall Rules
# ---------------------------------------------------------------------------------------------------------------------
variable "fw_rule_prefix" {
  default = "default-terraform"
}

variable "allow_ip_list" {
  type = "list"

  default = ["127.0.0.1/32"]
}

# ---------------------------------------------------------------------------------------------------------------------
# Instance Template
# ---------------------------------------------------------------------------------------------------------------------
variable "template_name" {
  default = "default-template"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "source_image" {
  default = "packer-XXXXXXXXXX"
}

variable "service_account" {
  type    = "list"
  default = ["userinfo-email", "compute-ro", "storage-ro", "sql-admin"]
}

# ---------------------------------------------------------------------------------------------------------------------
# Instance Group
# ---------------------------------------------------------------------------------------------------------------------
variable "healthcheck_name" {
  default = "default-healthcheck"
}

variable "group_name" {
  default = "default-group"
}

variable "target_size" {
  default = 3
}

# ---------------------------------------------------------------------------------------------------------------------
# HTTPS Proxy
# ---------------------------------------------------------------------------------------------------------------------
variable "https_url_map_name" {
  default = "default-proxy"
}

variable "https_proxy_name" {
  default = "default-https-proxy"
}

variable "https_proxy_backend_name" {
  default = "default-https-backend"
}

variable "https_fowarding-rule" {
  default = "default-https-forwarding-rule"
}

variable "https_health_check" {
  default = "default-https-health-check"
}

# ---------------------------------------------------------------------------------------------------------------------
# CloudSQL HA
# ---------------------------------------------------------------------------------------------------------------------
variable "sql_master_name" {
  default = "default-db-master"
}

variable "sql_replica_name" {
  default = "default-db-replica"
}

variable "db_version" {
  default = "MYSQL_5_7"
}

variable "sql_instance_size" {
  default = "db-f1-micro"
}

variable "database_name" {
  default = "database"
}

variable "database_users" {
  type    = "list"
  default = ["dbuser"]
}

variable "database_password" {
  type    = "list"
  default = ["changeme"]
}
