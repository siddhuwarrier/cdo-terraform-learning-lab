resource "cdo_user" "superadmins" {
  for_each         = var.cdo_superadmins
  name             = each.key
  role             = "ROLE_SUPER_ADMIN"
  is_api_only_user = false
}

resource "cdo_user" "readonly_users" {
  for_each         = var.cdo_readonly_users
  name             = each.key
  role             = "ROLE_READ_ONLY"
  is_api_only_user = false
}

resource "cdo_user" "my_user" {
  name             = "batman@gotham.com"
  role             = "ROLE_ADMIN"
  is_api_only_user = false
}

# Onboard an FTD
resource "fmc_access_policies" "fmc_access_policy" {
  name           = "terraformed-access-policy"
  default_action = "block"
}

resource "cdo_ftd_device" "ftd" {
  name               = "my-ftd"
  access_policy_name = fmc_access_policies.fmc_access_policy.name
  licenses           = ["BASE"]
  virtual            = true
  performance_tier   = "FTDv5"
  lifecycle {
    ignore_changes = [virtual]
  }
}

resource "null_resource" "configure_ftd_manager" {
  connection {
    type        = "ssh"
    user        = var.bastion_username
    host        = var.bastion_address
    private_key = var.bastion_private_key
  }

  provisioner "remote-exec" {
    inline = [
      "sshpass -p '${var.ftd_admin_password}' ssh -o \"StrictHostKeyChecking no\" admin@${var.ftd_mgmt_if_address} '${cdo_ftd_device.ftd.generated_command}'"
    ]
  }

  depends_on = [cdo_ftd_device.ftd]
}

resource "cdo_ftd_device_onboarding" "ftd" {
  ftd_uid    = cdo_ftd_device.ftd.id
  depends_on = [null_resource.configure_ftd_manager]
}
