
resource "outscale_vm" "vm_netbox_1" {

  image_id           = var.rocky_10_ami
  vm_type            = var.casual_vm_type
  keypair_name_wo    = var.server_key

  primary_nic  {
      nic_id = outscale_nic.netbox_1_nic.nic_id
      device_number = "0"
      }

  user_data = base64encode(<<-EOT
    #!/bin/bash
    hostnamectl set-hostname ${var.dns_project_name}-netbox-1
    dnf install epel-release -y
  EOT
  )

  tags {
    key   = "Name"
    value = "${var.project_name}_netbox_1"
  }
}

resource "outscale_nic" "netbox_1_nic" {

  subnet_id          = outscale_subnet.tools_subnet.subnet_id
  security_group_ids = [outscale_security_group.sg_tools.security_group_id]

  private_ips {
    is_primary = true
    private_ip = var.netbox_ip
  }
}

resource "outscale_volume" "netbox_1_data" {
  subregion_name = "${var.osc_region}a"
  size           = var.netbox_volume_size
  volume_type    = "gp2"


  tags {
    key   = "Name"
    value = "${var.project_name}_netbox_1_data"
  }
}

resource "outscale_volume_link" "netbox_1_volume_link" {
  device_name = "/dev/xvdb"
  volume_id   = outscale_volume.netbox_1_data.volume_id
  vm_id       = outscale_vm.vm_netbox_1.vm_id
}
