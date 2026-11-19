# DMZ Security Group

resource "outscale_security_group" "sg_ovpn" {
  description         = "DMZ security group"
  security_group_name = "${var.project_name}_ovpn"
  net_id              = outscale_net.main_vpc.net_id

  tags {
    key   = "Name"
    value = "${var.project_name}_dmz"
  }
}

resource "outscale_security_group_rule" "ovpn_ssh" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_ovpn.security_group_id
  rules {
    from_port_range = "22"
    to_port_range   = "22"
    ip_protocol     = "tcp"
    ip_ranges       = var.allowed_cidr
  }
}

resource "outscale_security_group_rule" "ovpn_ovpn_protocol" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_ovpn.security_group_id
  rules {
    from_port_range = "1194"
    to_port_range   = "1194"
    ip_protocol     = "tcp"
    ip_ranges       = var.allowed_cidr
  }
}

resource "outscale_security_group_rule" "ovpn_wg_protocol" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_ovpn.security_group_id
  rules {
    from_port_range = "51820"
    to_port_range   = "51820"
    ip_protocol     = "udp"
    ip_ranges       = var.allowed_cidr
  }
}

resource "outscale_security_group_rule" "ovpn_node_exporter" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_ovpn.security_group_id
  rules {
    from_port_range = "9100"
    to_port_range   = "9100"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.prometheus_ip[0]}/32", "${var.prometheus_ip[1]}/32"]
  }
}

resource "outscale_security_group_rule" "ovpn_transit_homeassistant" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_ovpn.security_group_id
  rules {
    from_port_range = "80"
    to_port_range   = "80"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.haproxy_int_ip}/32"]
  }
}

resource "outscale_security_group_rule" "ovpn_transit_openwebui" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_ovpn.security_group_id
  rules {
    from_port_range = "8000"
    to_port_range   = "8000"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.webui_ip}/32"]
  }
}
