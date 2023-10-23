terraform {
  required_version = ">= 1.3"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = ">=3.14"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

# create private location
resource "newrelic_synthetics_private_location" "main" {
  account_id  = var.account_id
  description = "A private location for an example"
  name        = "TF Example"
}

# the private location is never immediately available
resource "time_sleep" "wait_seconds" {
  depends_on = [newrelic_synthetics_private_location.main]

  create_duration = "20s"
}
