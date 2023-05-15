terraform {
  required_version = ">=1.3"
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
