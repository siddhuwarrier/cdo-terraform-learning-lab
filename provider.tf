terraform {
  required_providers {
    cdo = {
      source  = "CiscoDevnet/cdo"
      version = ">=1.0.4"
    }
    fmc = {
      source  = "CiscoDevNet/fmc"
      version = "1.4.6"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

provider "cdo" {
  base_url  = var.base_url
  api_token = var.cdo_api_token
}

data "cdo_cdfmc" "current" {}

provider "fmc" {
  fmc_host          = data.cdo_cdfmc.current.hostname
  is_cdfmc          = true
  cdo_token         = var.cdo_api_token
  cdfmc_domain_uuid = data.cdo_cdfmc.current.domain_uuid
}

provider "null" {}