# Example variable values for the terraform-homelab project.
#
# Copy to terraform.tfvars and fill in real values. terraform.tfvars is
# gitignored on purpose: the authoritative copy lives in the private
# companion repo, never in git history of this public repository.

# Outscale API credentials (required)
osc_access_key = "YOUR_OUTSCALE_ACCESS_KEY"
osc_secret_key = "YOUR_OUTSCALE_SECRET_KEY"

# Project naming
project_name     = "my_project"
dns_project_name = "my-project"

# Outscale keypair names
dmz_vpn_key   = "YOUR_DMZ_VPN_KEYPAIR"
dmz_other_key = "YOUR_DMZ_OTHER_KEYPAIR"
server_key    = "YOUR_SERVER_KEYPAIR"

# CIDRs allowed to SSH into the OpenVPN VM (required)
allowed_cidr = [
  "203.0.113.10/32",
  "198.51.100.25/32",
]

# Network plan (see variables.tf for defaults)
vpc_cidr     = "10.0.0.0/16"
dmz_subnet   = "10.0.0.0/24"
tools_subnet = "10.0.100.0/24"
k8s_subnet   = "10.0.8.0/24"

# Static private IPs (see variables.tf for defaults)
ovpn_ip       = "10.0.0.254"
cold_vault_ip = "10.0.0.253"
haproxy_ip    = "10.0.0.200"
haproxy_int_ip = "10.0.100.200"
ns_ips        = ["10.0.100.11", "10.0.100.12"]
prometheus_ip = ["10.0.100.20", "10.0.100.21"]
grafana_ip    = "10.0.100.22"
loki_ip       = "10.0.100.23"
ca_1_ip       = "10.0.100.5"
gpu_1_ip      = "10.0.100.40"

postgresql_ips                = ["10.0.8.4", "10.0.8.5", "10.0.8.6"]
k8s_master_ips                = ["10.0.8.11", "10.0.8.12", "10.0.8.13"]
k8s_worker_ips                = ["10.0.8.101", "10.0.8.102", "10.0.8.103"]
k8s_controller_ip             = "10.0.8.10"
metallb_parking_ip            = "10.0.8.230"
metallb_parking_secondary_ips = ["10.0.8.231", "10.0.8.232", "10.0.8.233", "10.0.8.234", "10.0.8.235"]
