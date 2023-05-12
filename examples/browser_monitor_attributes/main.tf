provider "newrelic" {
  account_id = var.account_id
}

module "main" {
  source = "../.."

  account_id = var.account_id
  enabled    = var.enabled
  name       = "Browser Monitor Attributes"
  type       = "BROWSER"
  uri        = "https://www.one.newrelic.com"

  public_locations = ["US_WEST_1"]

  # Additional attributes supported by monitor
  validation_string = "New Relic"
  verify_ssl        = true

  # Additional attributes supported by the Browser monitor
  script_language                         = "JAVASCRIPT"
  runtime_type                            = "CHROME_BROWSER"
  runtime_version                         = "100"
  enable_screenshot_on_failure_and_script = true

  tags = {
    "App.Id"   = ["1234"]
    "App.Code" = ["EXAMPLE"]
  }
}
