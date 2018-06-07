# ---------------------------------------------------------------------------------------------------------------------
# Instance Group - Default VARIABLE -
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
  default = "asia-northeast1"
}

variable "zone" {
  type    = "list"
  default = ["asia-northeast1-a", "asia-northeast1-b", "asia-northeast1-c"]
}

variable "healthcheck_name" {
  default = "default-healthcheck"
}

variable "group_name" {
  default = "default-group"
}

variable "target_size" {
  default = 3
}

variable "source_image" {}
variable "instance_template_link" {}
