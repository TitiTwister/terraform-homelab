# Wireguard Security Group

resource "outscale_security_group" "sg_wireguard" {
  description         = "Wireguard security group"
  security_group_name = "${var.dns_project_name}-wireguard-1"
  net_id              = outscale_net.main_vpc.net_id

  tags {
    key   = "Name"
    value = "${var.dns_project_name}-wireguard-1"
  }
}

resource "outscale_security_group_rule" "wireguard_ssh" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_wireguard.security_group_id
  rules {
    from_port_range = "22"
    to_port_range   = "22"
    ip_protocol     = "tcp"
    ip_ranges       = var.allowed_cidr
  }
}

resource "outscale_security_group_rule" "wireguard_node_exporter" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_wireguard.security_group_id
  rules {
    from_port_range = "9100"
    to_port_range   = "9100"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.prometheus_ip[0]}/32", "${var.prometheus_ip[1]}/32"]
  }
}

