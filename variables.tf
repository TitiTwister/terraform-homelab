variable "osc_access_key" {
  description = "AK"
  type        = string
}

variable "osc_secret_key" {
  description = "SK"
  type        = string
}

variable "osc_region" {
  description = "Outscale region"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "home_vpc"
}

variable "dns_project_name" {
  description = "Project name"
  type        = string
  default     = "home-vpc"
}

variable "vpc_cidr" {
  description = "Main VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "dmz_subnet" {
  description = "DMZ subnet CIDR"
  type        = string
  default     = "10.0.0.0/24"
}

variable "tools_subnet" {
  description = "TOOLS subnet CIDR"
  type        = string
  default     = "10.0.100.0/24"
}

variable "k8s_subnet" {
  description = "Kubernetes nodes subnet CIDR"
  type        = string
  default     = "10.0.8.0/24"
}

variable "allowed_cidr" {
  description = "List of all IP allowed to SSH OpenVPN VM"
  type        = list(string)
}

variable "ovpn_ip" {
  description = "Private ip for OpenVPN VM"
  type        = string
  default     = "10.0.0.254"
}

variable "cold_vault_ip" {
  description = "Private ip for OpenVPN VM"
  type        = string
  default     = "10.0.0.253"
}

variable "haproxy_ip" {
  description = "Private ip for HAPROXY DMZ VM"
  type        = string
  default     = "10.0.0.200"
}

variable "haproxy_int_ip" {
  description = "Private ip for internal HAPROXY VM"
  type        = string
  default     = "10.0.100.200"
}

variable "ns_ips" {
  description = "List of private IPs for DNS VMs"
  type        = list(string)
  default     = ["10.0.100.11", "10.0.100.12"]
}

variable "ca_1_ip" {
  description = "Private ip for CA ISSUER VM"
  type        = string
  default     = "10.0.100.5"
}

variable "prometheus_ip" {
  description = "Private ip for PROMETHEUS VM"
  type        = list(string)
  default     = ["10.0.100.20", "10.0.100.21"]
}

variable "grafana_ip" {
  description = "Private ip for GRAFANA VM"
  type        = string
  default     = "10.0.100.22"
}

variable "loki_ip" {
  description = "Private ip for PROMETHEUS VM"
  type        = string
  default     = "10.0.100.23"
}

variable "rocky_10_ami" {
  description = "AMI id for rocky 10 image"
  type        = string
  default     = "ami-ebce0925"
}

variable "small_vm_type" {
  description = "VM type for casual usage"
  type        = string
  default     = "tinav7.c1r2p2"
}

variable "casual_vm_type" {
  description = "VM type for casual usage"
  type        = string
  default     = "tinav7.c2r8p2"
}

variable "medium_vm_type" {
  description = "VM type for medium usage"
  type        = string
  default     = "tinav7.c4r16p2"
}

variable "gpu_vm_type" {
  description = "VM type for L40 GPU VM (must be v7 generation with p1 performance flag for the nvidia-l40 fGPU)"
  type        = string
  default     = "tinav7.c16r64p1"
}

variable "dmz_vpn_key" {}
variable "dmz_other_key" {}
variable "server_key" {}

variable "postgresql_ips" {
  description = "List of private IPs for PostgreSQL VMs in K8S subnet"
  type        = list(string)
  default     = ["10.0.8.4", "10.0.8.5", "10.0.8.6"]
}

variable "k8s_master_ips" {
  description = "List of private IPs for K8s master VMs"
  type        = list(string)
  default     = ["10.0.8.11", "10.0.8.12", "10.0.8.13"]
}

variable "k8s_worker_ips" {
  description = "List of private IPs for K8s worker VMs"
  type        = list(string)
  default     = ["10.0.8.200", "10.0.8.201", "10.0.8.202"]
}

variable "k8s_controller_ip" {
  description = "Private IP for K8s controller VM"
  type        = string
  default     = "10.0.8.10"
}

variable "metallb_parking_ip" {
  description = "Private IP for MetalLB parking VM"
  type        = string
  default     = "10.0.8.230"
}

variable "metallb_parking_secondary_ips" {
  description = "Secondary private IPs for MetalLB parking VM"
  type        = list(string)
  default     = ["10.0.8.231", "10.0.8.232", "10.0.8.233", "10.0.8.234", "10.0.8.235"]
}

variable "cold_vault_volume_size" {
  description = "Size in GB for cold vault data volume"
  type        = number
  default     = 50
}

variable "cold_vault_volume_iops" {
  description = "IOPS for cold vault io1 volume"
  type        = number
  default     = 300
}

variable "ca_1_volume_size" {
  description = "Size in GB for ca issuer data volume"
  type        = number
  default     = 50
}

variable "ca_1_volume_iops" {
  description = "IOPS for cold ca issuer io1 volume"
  type        = number
  default     = 300
}

variable "prom_volume_size" {
  description = "Size in GB for prometheus data volumes"
  type        = number
  default     = 50
}

variable "prom_volume_iops" {
  description = "IOPS for prometheus io1 volume"
  type        = number
  default     = 1000
}

variable "postgresql_volume_size" {
  description = "Size in GB for postgresql data volumes"
  type        = number
  default     = 200
}

variable "postgresql_volume_iops" {
  description = "IOPS for postgresql io1 volume"
  type        = number
  default     = 5000
}

variable "k8s_worker_volume_system_size" {
  description = "Size in GB for k8s worker data volumes"
  type        = number
  default     = 50
}

variable "k8s_worker_volume_data_size" {
  description = "Size in GB for k8s worker data volumes"
  type        = number
  default     = 300
}

variable "loki_volume_size" {
  description = "Size in GB for k8s worker data volumes"
  type        = number
  default     = 50
}

variable "gpu_1_ip" {
  description = "Private ip for GPU VM"
  type        = string
  default     = "10.0.100.40"
}

variable "gpu_1_volume_size" {
  description = "Size in GB for GPU VM data volume"
  type        = number
  default     = 1000
}

variable "gpu_1_volume_iops" {
  description = "IOPS for GPU VM io1 volume"
  type        = number
  default     = 13000
}

