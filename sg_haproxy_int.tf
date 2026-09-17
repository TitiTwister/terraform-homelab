# Internal HAProxy Security Group

resource "outscale_security_group" "sg_haproxy_int" {
  description         = "Internal HAPROXY security group"
  security_group_name = "${var.project_name}_haproxy_int"
  net_id              = outscale_net.main_vpc.net_id

  tags {
    key   = "Name"
    value = "${var.project_name}_haproxy_int"
  }
}

resource "outscale_security_group_rule" "haproxy_int_ssh" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_haproxy_int.security_group_id
  rules {
    from_port_range = "22"
    to_port_range   = "22"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.ovpn_ip}/32"]
  }
}

resource "outscale_security_group_rule" "haproxy_int_http" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_haproxy_int.security_group_id
  rules {
    from_port_range = "80"
    to_port_range   = "80"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.ovpn_ip}/32", "${var.k8s_subnet}"]
  }
}

resource "outscale_security_group_rule" "haproxy_int_https" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_haproxy_int.security_group_id
  rules {
    from_port_range = "443"
    to_port_range   = "443"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.ovpn_ip}/32", "${var.k8s_subnet}"]
  }
}

resource "outscale_security_group_rule" "haproxy_int_sshssh" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_haproxy_int.security_group_id
  rules {
    from_port_range = "2222"
    to_port_range   = "2222"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.ovpn_ip}/32","${var.k8s_subnet}"]
  }
}

resource "outscale_security_group_rule" "haproxy_int_icmp" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_haproxy_int.security_group_id
  rules {
    from_port_range = "-1"
    to_port_range   = "-1"
    ip_protocol     = "icmp"
    ip_ranges       = ["${var.ovpn_ip}/32", "${var.k8s_subnet}"]
  }
}

resource "outscale_security_group_rule" "haproxy_int_kapi" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_haproxy_int.security_group_id
  rules {
    from_port_range = "6443"
    to_port_range   = "6443"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.k8s_subnet}"]
  }
}

resource "outscale_security_group_rule" "haproxy_int_postgre" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_haproxy_int.security_group_id
  rules {
    from_port_range = "5432"
    to_port_range   = "5433"
    ip_protocol     = "tcp"
    ip_ranges       = ["${var.k8s_subnet}"]
  }
}
