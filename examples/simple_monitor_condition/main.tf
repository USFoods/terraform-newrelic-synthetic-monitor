terraform {
  required_version = ">=1.3"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~>3.13.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "newrelic" {
  account_id = var.account_id
}

module "main" {
  source = "../.."

  account_id = var.account_id
  enabled    = var.enabled
  name       = "Simple Monitor Public"

  uri = "https://www.one.newrelic.com"

  script_language = "JAVASCRIPT"
  runtime_type    = "NODE_API"
  runtime_version = "16.10"

  public_locations = ["US_WEST_1"]

  tags = {
    "App.Id"   = ["1234"]
    "App.Code" = ["EXAMPLE"]
  }
}
