terraform {
  required_providers {
    outscale = {
      source = "outscale/outscale"
      version = "1.3.0"
    }
  }

  backend "s3" {
    # bucket and key are injected at init time from the private companion repo:
    #   terraform init -backend-config=../terraform-home-eu/backend.hcl

    endpoints = {
      s3 = "https://oos.eu-west-2.outscale.com"
    }

    region                      = "eu-west-2"
    use_path_style              = true
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_lockfile                = true
  }
}

provider "outscale" {
  access_key_id = var.osc_access_key
  secret_key_id = var.osc_secret_key
  region        = var.osc_region
  endpoints {
    api  = "api.eu-west-2.outscale.com"
  }
}
