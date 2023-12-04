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
