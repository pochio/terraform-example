# ---------------------------------------------------------------------------------------------------------------------
# CloudSQL HA - DEFAULT VARIABLE -
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
  default = "asia-northeast1"
}

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
