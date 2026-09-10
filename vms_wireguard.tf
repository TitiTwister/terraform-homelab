resource "outscale_vm" "vm_wireguard" {
  image_id        = var.rocky_10_ami
  vm_type         = var.casual_vm_type
  keypair_name_wo = var.dmz_vpn_key
  primary_nic {
    nic_id        = outscale_nic.wireguard_nic.nic_id
    device_number = "0"
  }

  user_data = base64encode(<<-EOT
    #!/bin/bash
    hostnamectl set-hostname ${var.dns_project_name}-wireguard-1
    dnf install epel-release -y
  EOT
  )

  tags {
    key   = "Name"
    value = "${var.dns_project_name}-wireguard-1"
  }

}

resource "outscale_public_ip" "wireguard_public_ip" {
}

resource "outscale_public_ip_link" "wireguard_public_ip_link" {
  vm_id     = outscale_vm.vm_wireguard.vm_id
  public_ip = outscale_public_ip.wireguard_public_ip.public_ip
}

resource "outscale_nic" "wireguard_nic" {
  subnet_id          = outscale_subnet.dmz_subnet.subnet_id
  security_group_ids = [outscale_security_group.sg_wireguard.security_group_id]
  private_ips {
    is_primary = true
    private_ip = var.wireguard_ip
  }
}

