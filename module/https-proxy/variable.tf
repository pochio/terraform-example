
# ---------------------------------------------------------------------------------------------------------------------
# HTTP Proxy - DEFAULT VARIABLE -
# ---------------------------------------------------------------------------------------------------------------------
variable "url_map_name"         { default = "default-proxy" }
variable "proxy_name"           { default = "default-https-proxy"}
variable "proxy_backend_name"   { default = "default-backend"}
variable "fowarding-rule"       { default = "default-forwarding-rule"}
variable "http_health_check"    { default = "default-http-health-check"}

variable instance_group_link    {}
variable healthcheck_link       {}