# ---------------------------------------------------------------------------------------------------------------------
# Instance Template - DEFUALT VARIABLE -
# ---------------------------------------------------------------------------------------------------------------------
variable "template_name" {
  default = "default-template"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "source_image" {
  default = "centos-cloud/centos-7"
}

variable "vpc_subnetwork" {
  default = "default"
}

variable "firewall_rules" {
  type    = "list"
  default = ["http-server", "https-server"]
}

variable "service_account" {
  type    = "list"
  default = ["userinfo-email", "compute-ro", "storage-ro"]
}
