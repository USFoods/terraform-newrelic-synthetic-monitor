output "policy_id" {
  description = "The ID of the policy where this condition is used"
  value       = newrelic_alert_policy.main.id
}

output "policy_name" {
  description = "The name of the policy"
  value       = newrelic_alert_policy.main.name
}

output "policy_incident_preference" {
  description = "The rollup strategy for the policy"
  value       = newrelic_alert_policy.main.incident_preference
}

output "module_id" {
  description = "The ID of the Synthetics script monitor"
  value       = module.main.id
}

output "module_status" {
  description = "The run state of the monitor"
  value       = module.main.status
}

output "module_name" {
  description = "The name for the monitor"
  value       = module.main.name
}

output "module_type" {
  description = "The plaintext representing the monitor script"
  value       = module.main.type
}

output "module_private_locations" {
  description = "The private locations the monitor is running from"
  value       = module.main.private_locations
}

output "module_public_locations" {
  description = "The public locations the monitor is running from"
  value       = module.main.public_locations
}

output "module_period" {
  description = "The interval at which this monitor is run"
  value       = module.main.period
}

output "module_script_language" {
  description = "The programing language that executes the script"
  value       = module.main.script_language
}

output "module_runtime_type" {
  description = "The runtime that the monitor uses to run jobs"
  value       = module.main.runtime_type
}

output "module_runtime_version" {
  description = "The specific version of the runtime type selected"
  value       = module.main.runtime_version
}

output "treat_redirect_as_failure" {
  description = "Categorize redirects during a monitor job as a failure"
  value       = module.main.treat_redirect_as_failure
}

output "bypass_head_request" {
  description = "Monitor should skip default HEAD request and instead use GET verb in check"
  value       = module.main.bypass_head_request
}

output "module_tags" {
  description = "The tags associated with the synthetics script monitor"
  value       = module.main.tags
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
