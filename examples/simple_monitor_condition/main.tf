provider "newrelic" {
  account_id = var.account_id
}

resource "newrelic_alert_policy" "main" {
  name                = "Simple Monitor Condition Policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

module "main" {
  source = "../.."

  account_id = var.account_id
  enabled    = var.enabled
  name       = "Simple Monitor Condition"

  uri = "https://www.one.newrelic.com"

  script_language = "JAVASCRIPT"
  runtime_type    = "NODE_API"
  runtime_version = "16.10"
  type            = "SIMPLE"

  public_locations = ["US_WEST_1"]

  condition = {
    policy_id = newrelic_alert_policy.main.id
  }

  tags = {
    "App.Id"   = ["1234"]
    "App.Code" = ["EXAMPLE"]
  }
}
