run "monitor configuration" {
  command = apply

  assert {
    condition     = output.main.enabled == false
    error_message = "monitor enabled did not match expected"
  }

  assert {
    condition     = output.main.name == "Simple Monitor Attributes"
    error_message = "monitor name did not match expected"
  }

  assert {
    condition     = output.main.type == "SIMPLE"
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
    condition     = output.main.validation_string == "New Relic"
    error_message = "monitor validation string did not match expected"
  }

  assert {
    condition     = output.main.verify_ssl == true
    error_message = "monitor verify ssl did not match expected"
  }

  assert {
    condition     = output.main.treat_redirect_as_failure == true
    error_message = "monitor treat redirect as failure did not match expected"
  }

  assert {
    condition     = output.main.bypass_head_request == true
    error_message = "monitor bypass head request did not match expected"
  }

  assert {
    condition     = output.main.script_language == ""
    error_message = "monitor script language did not match expected"
  }

  assert {
    condition     = output.main.runtime_type == ""
    error_message = "monitor runtime type did not match expected"
  }

  assert {
    condition     = output.main.runtime_version == ""
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
