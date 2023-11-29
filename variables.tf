variable "base_url" {
  description = "The base CDO URL. This is the URL you enter when logging into your CDO account."
  type        = string
  # this is being used in Cisco Live APJC, so we're using CDO in APJ
  default = "https://apj.cdo.cisco.com"
}

variable "cdo_api_token" {
  description = "The API token used to authenticate with CDO. Watch this video to learn how to generate this value: https://app.vidcast.io/share/e3fb2957-0991-4a98-a256-46485323a703. Please enter this value in secrets.auto.tfvars."
  type        = string
  sensitive   = true
}

variable "cdo_superadmins" {
  description = "Specify a list of CDO users you want to add to this tenant with superadmin privileges. We have provided default values in terraform.auto.tfvars in case you do not wish to enter your own. These users have to have valid Cisco Security accounts."
  type        = set(string)
}

variable "cdo_readonly_users" {
  description = "Specify a list of CDO users you want to add to this tenant with read-only privileges. We have provided default values in terraform.auto.tfvars in case you do not wish to enter your own. These users have to have valid Cisco Security accounts."
  type        = set(string)
}

variable "asa_mgmt_if_address" {
  description = "The Fully Qualified Domain name of the management interface of the ASA you will be onboarding as part of this workshop. Please enter this value in terraform.auto.tfvars."
  type        = string
}

variable "asa_username" {
  description = "The username on the ASA that CDO should use to log in and start managing ASA policies."
  type        = string
  default     = "admin"
}

variable "asa_password" {
  description = "The password for the ASA user defined in asa_username.  Please enter this value in secrets.auto.tfvars."
}

variable "ftd_mgmt_if_address" {
  description = "The Fully Qualified Domain name of the management interface of the FTD you will be onboarding as part of this workshop. Please enter this value in terraform.auto.tfvars."
  type        = string
}

variable "ftd_admin_password" {
  description = "The password for the FTD admin user.  Please enter this value in secrets.auto.tfvars."
  type        = string
}

variable "bastion_username" {
  description = "The username for the Bastion host that allows SSH communications with the ASAs and FTDs in the deployment."
  type        = string
  default     = "ubuntu"
}

variable "bastion_address" {
  description = "The address for the Bastion host that allows SSH communications with the ASAs and FTDs in the deployment."
  type        = string
  default     = "bastion.ciscolive.labs.cdo.cisco.com"
}

variable "bastion_private_key" {
  description = "The private key of the Bastion host that allows SSH communications with the ASAs and FTDs in the deployment."
}