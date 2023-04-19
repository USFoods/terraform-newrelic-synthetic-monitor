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

output "module_treat_redirect_as_failure" {
  description = "Categorize redirects during a monitor job as a failure"
  value       = module.main.treat_redirect_as_failure
}

output "module_bypass_head_request" {
  description = "Monitor should skip default HEAD request and instead use GET verb in check"
  value       = module.main.bypass_head_request
}

output "module_verify_ssl" {
  description = "Monitor should verify SSL certificates"
  value       = module.main.verify_ssl
}

output "module_validation_string" {
  description = "The string to validate the response"
  value       = module.main.validation_string
}

output "module_tags" {
  description = "The tags associated with the synthetics script monitor"
  value       = module.main.tags
}
