# ---------------------------------------------------------------------------------------------------------------------
# Firewall Rules - DEFAULT VARIABLE -
# ---------------------------------------------------------------------------------------------------------------------
variable "fw_rule_prefix" {
  default = "default"
}

variable "vpc_network" {
  default = "default"
}

variable "allow_ip_list" {
  type = "list"

  default = ["127.0.0.1/32"]
}
