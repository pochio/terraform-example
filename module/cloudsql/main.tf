# ---------------------------------------------------------------------------------------------------------------------
# CloudSQL HA
# ---------------------------------------------------------------------------------------------------------------------

resource "google_sql_database_instance" "master" {
  name             = "${var.sql_master_name}"
  database_version = "${var.db_version}"
  region           = "${var.region}"

  settings {
    tier = "${var.sql_instance_size}"

    backup_configuration {
      binary_log_enabled = "true"
      enabled            = "true"
      start_time         = "20:00"
    }

    maintenance_window {
      day  = "7"
      hour = "17"
    }
  }
}

resource "google_sql_database_instance" "replica" {
  depends_on = [
    "google_sql_database_instance.master",
    "google_sql_database.database",
    "google_sql_user.users",
  ]

  name             = "${var.sql_replica_name}"
  database_version = "${var.db_version}"
  region           = "${var.region}"

  master_instance_name = "${google_sql_database_instance.master.name}"

  replica_configuration {
    failover_target = "true"
  }

  settings {
    tier = "${var.sql_instance_size}"

    maintenance_window {
      day  = "7"
      hour = "17" #<-UTC
    }
  }
}

resource "google_sql_database" "database" {
  depends_on = [
    "google_sql_database_instance.master",
  ]

  name      = "${var.database_name}"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  depends_on = [
    "google_sql_database_instance.master",
  ]

  count    = "${length(var.database_users)}"
  name     = "${element(var.database_users, count.index)}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "%"
  password = "${element(var.database_password, count.index)}"
}
