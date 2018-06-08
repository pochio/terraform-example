provider "google" {
  project = "terraform-project" #<-任意のプロジェクト名に修正
  region  = "asia-northeast1"
}

terraform {
  backend "gcs" {
    bucket = "terraform-bucket"  #<-任意のバケット名・prefixに修正
    prefix = "terraform/tfstate"
  }
}

module "vpc-network" {
  source = "./module/vpc-network"

  vpc_name        = "${var.vpc_name}"
  subnetwork_name = "${var.subnetwork_name}"
  subnetwork_cidr = "${var.subnetwork_cidr}"
}

module "firewall" {
  source      = "./module/firewall"
  vpc_network = "${module.vpc-network.default-network}"

  fw_rule_prefix = "${var.fw_rule_prefix}"
  allow_ip_list  = "${var.allow_ip_list}"
}

module "instance-template" {
  source         = "./module/instance-template"
  firewall_rules = "${module.firewall.rules}"
  vpc_subnetwork = "${module.vpc-network.asia-northeast1-subnetwork}"

  template_name   = "${var.template_name}"
  machine_type    = "${var.machine_type}"
  source_image    = "${var.source_image}"
  service_account = "${var.service_account}"
}

module "instange-group" {
  source                 = "./module/instance-group"
  instance_template_link = "${module.instance-template.instance_template_link}"

  region           = "${var.region}"
  zone             = "${var.zone}"
  source_image     = "${var.source_image}"
  healthcheck_name = "${var.healthcheck_name}"
  group_name       = "${var.group_name}"
  target_size      = "${var.target_size}"
}

module "https-proxy" {
  source              = "./module/https-proxy"
  instance_group_link = "${module.instange-group.instance_group_link}"
  healthcheck_link    = "${module.instange-group.healthcheck_link}"

  proxy_name         = "${var.https_proxy_name}"
  proxy_backend_name = "${var.https_proxy_backend_name}"
  fowarding-rule     = "${var.https_fowarding-rule}"
  url_map_name       = "${var.https_url_map_name}"
  http_health_check  = "${var.https_health_check}"
}

module "cloudsql" {
  source = "./module/cloudsql"

  sql_master_name   = "${var.sql_master_name}"
  sql_replica_name  = "${var.sql_replica_name}"
  db_version        = "${var.db_version}"
  sql_instance_size = "${var.sql_instance_size}"
  database_name     = "${var.database_name}"
  database_users    = "${var.database_users}"
  database_password = "${var.database_password}"
}
