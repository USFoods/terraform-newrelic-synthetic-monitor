terraform {
  required_version = ">= 1.3"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = ">= 3.13"
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

provider "time" {
  # configuration options
}

# create private location
resource "newrelic_synthetics_private_location" "main" {
  description = "A private location for an example"
  name        = "TF Example"
}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [newrelic_synthetics_private_location.main]

  create_duration = "10s"
}

# create module for private browser monitor
module "main" {
  source = "../.."

  depends_on = [time_sleep.wait_10_seconds]

  account_id = var.account_id
  enabled    = var.enabled
  name       = "Browser Monitor Private"
  type       = "BROWSER"

  script_language = "JAVASCRIPT"
  runtime_type    = "CHROME_BROWSER"
  runtime_version = "100"

  uri = "https://www.one.newrelic.com"

  private_locations = ["TF Example"]

  tags = {
    "App.Id"   = ["1234"]
    "App.Code" = ["EXAMPLE"]
  }
}
