provider "newrelic" {
  account_id = var.account_id
}

module "main" {
  source = "../.."

  account_id = var.account_id
  enabled    = var.enabled
  name       = "Simple Monitor Attributes"
  uri        = "https://www.one.newrelic.com"

  public_locations = ["US_WEST_1"]

  # Additional attributes supported by monitor
  validation_string = "New Relic"
  verify_ssl        = true

  # Additional attributes supported by the SIMPLE monitor
  treat_redirect_as_failure = true
  bypass_head_request       = true

  tags = {
    "App.Id"   = ["1234"]
    "App.Code" = ["EXAMPLE"]
  }
}
