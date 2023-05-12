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
