
resource "outscale_vm" "vm_ci_1" {

  image_id        = var.rocky_10_ami
  vm_type         = var.casual_vm_type
  keypair_name_wo = var.server_key

  primary_nic {
    nic_id        = outscale_nic.ci_1_nic.nic_id
    device_number = "0"
  }

  user_data = base64encode(<<-EOT
    #!/bin/bash
    hostnamectl set-hostname ${var.dns_project_name}-ci-1
    dnf install epel-release -y
  EOT
  )

  tags {
    key   = "Name"
    value = "${var.project_name}_ci_1"
  }
}

resource "outscale_nic" "ci_1_nic" {

  subnet_id          = outscale_subnet.tools_subnet.subnet_id
  security_group_ids = [outscale_security_group.sg_tools.security_group_id]

  private_ips {
    is_primary = true
    private_ip = var.ci_1_ip
  }
}

resource "outscale_volume" "ci_1_data" {
  subregion_name = "${var.osc_region}a"
  size           = var.ci_1_volume_size
  volume_type    = "gp2"

  tags {
    key   = "Name"
    value = "${var.project_name}_ci_1_data"
  }
}

resource "outscale_volume_link" "ci_1_volume_link" {
  device_name = "/dev/xvdb"
  volume_id   = outscale_volume.ci_1_data.volume_id
  vm_id       = outscale_vm.vm_ci_1.vm_id
}
