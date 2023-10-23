run "policy_configuration" {
  command = apply

  assert {
    condition     = output.policy_name == "Browser Monitor Condition Policy"
    error_message = "policy name did not match expected"
  }

  assert {
    condition     = output.policy_incident_preference == "PER_CONDITION_AND_TARGET"
    error_message = "policy incident preference did not match expected"
  }
}

run "monitor_configuration" {
  command = apply

  assert {
    condition     = output.main.enabled == false
    error_message = "monitor enabled did not match expected"
  }

  assert {
    condition     = output.main.name == "Browser Monitor Condition"
    error_message = "monitor name did not match expected"
  }

  assert {
    condition     = output.main.type == "BROWSER"
    error_message = "monitor type did not match expected"
  }

  assert {
    condition     = output.main.uri == "https://www.one.newrelic.com"
    error_message = "monitor uri did not match expected"
  }

  assert {
    condition     = output.main.public_locations == toset(["US_WEST_1"])
    error_message = "monitor public locations did not match expected"
  }

  assert {
    condition     = output.main.script_language == "JAVASCRIPT"
    error_message = "monitor script language did not match expected"
  }

  assert {
    condition     = output.main.runtime_type == "CHROME_BROWSER"
    error_message = "monitor runtime type did not match expected"
  }

  assert {
    condition     = output.main.runtime_version == "100"
    error_message = "monitor runtime version did not match expected"
  }

  assert {
    condition     = output.main.enable_screenshot_on_failure_and_script == false
    error_message = "monitor enable screenshot did not match expected"
  }

  assert {
    condition     = output.main.tags == { "Origin" : "Terraform", "App.Id" : "1234", "App.Code" : "EXAMPLE" }
    error_message = "monitor enable screenshot did not match expected"
  }
}

run "condition_configuration" {
  command = apply

  assert {
    condition     = output.main.condition_policy_id == output.policy_id
    error_message = "condition policy id did not match expected"
  }

  assert {
    condition     = output.main.condition_enabled == false
    error_message = "condition enabled did not match expected"
  }

  assert {
    condition     = output.main.condition_name == "Browser Monitor Condition"
    error_message = "condition name did not match expected"
  }

  assert {
    condition     = strcontains(output.main.condition_nrql_query, output.main.id)
    error_message = "condition nrql did not contain expected"
  }
}
