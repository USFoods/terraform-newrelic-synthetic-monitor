output "id" {
  description = "The ID of the Synthetics script monitor"
  value       = module.main.id
}

output "account_id" {
  description = "The account in which the Synthetics monitor was created"
  value       = module.main.account_id
}

output "enabled" {
  description = "The run state of the monitor"
  value       = module.main.enabled
}

output "name" {
  description = "The name for the monitor"
  value       = module.main.name
}

output "period" {
  description = "The interval at which this monitor is run"
  value       = module.main.period
}

output "uri" {
  description = "The URI the monitor runs against"
  value       = module.main.uri
}

output "type" {
  description = "The plaintext representing the monitor script"
  value       = module.main.type
}

output "public_locations" {
  description = "The public locations the monitor is running from"
  value       = module.main.public_locations
}

output "private_locations" {
  description = "The private locations the monitor is running from"
  value       = module.main.private_locations
}

output "validation_string" {
  description = "The string to validate the response"
  value       = module.main.validation_string
}

output "verify_ssl" {
  description = "Monitor should verify SSL certificates"
  value       = module.main.verify_ssl
}

output "tags" {
  description = "The tags associated with the synthetics script monitor"
  value       = module.main.tags
}

output "treat_redirect_as_failure" {
  description = "Categorize redirects during a monitor job as a failure"
  value       = module.main.treat_redirect_as_failure
}

output "bypass_head_request" {
  description = "Monitor should skip default HEAD request and instead use GET verb in check"
  value       = module.main.bypass_head_request
}

output "enable_screenshot_on_failure_and_script" {
  description = "Capture a screenshot during job execution"
  value       = module.main.enable_screenshot_on_failure_and_script
}

output "runtime_version" {
  description = "The specific version of the runtime type selected"
  value       = module.main.runtime_version
}

output "runtime_type" {
  description = "The runtime that the monitor uses to run jobs"
  value       = module.main.runtime_type
}

output "script_language" {
  description = "The programing language that executes the script"
  value       = module.main.script_language
}

output "condition_policy_id" {
  description = "The ID of the policy where this condition is used"
  value       = module.main.condition_policy_id
}

output "condition_enabled" {
  description = "Whether the alert condition is enabled"
  value       = module.main.condition_enabled
}

output "condition_name" {
  description = "The title of the condition"
  value       = module.main.condition_name
}

output "condition_description" {
  description = "The description of the NRQL alert condition"
  value       = module.main.condition_description
}

output "condition_runbook_url" {
  description = "Runbook URL to display in notifications"
  value       = module.main.condition_runbook_url
}

output "condition_tags" {
  description = "The tags associated with the alert condition"
  value       = module.main.condition_tags
}

output "condition_critical_operator" {
  description = "The operator used when evaluating the critical threshold"
  value       = module.main.condition_critical_operator
}

output "condition_critical_threshold" {
  description = "The value which will trigger a critical incident"
  value       = module.main.condition_critical_threshold
}

output "condition_critical_threshold_duration" {
  description = "The duration, in seconds, that the threshold must violate in order to create an incident"
  value       = module.main.condition_critical_threshold_duration
}

output "condition_critical_threshold_occurrences" {
  description = "The criteria for how many data points must be in violation for the specified threshold duration"
  value       = module.main.condition_critical_threshold_occurrences
}
