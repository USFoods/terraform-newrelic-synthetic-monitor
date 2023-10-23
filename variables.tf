variable "account_id" {
  description = "The id of the account where where the synthetic monitor lives"
  type        = string
}

variable "enabled" {
  default     = false
  description = "The run state of the monitor"
  type        = bool
}

variable "name" {
  description = "The name for the monitor"
  type        = string
}

variable "period" {
  default     = "EVERY_15_MINUTES"
  description = "The interval at which this monitor should run"
  type        = string
}

variable "uri" {
  description = "he URI the monitor runs against"
  type        = string
}

variable "type" {
  default     = "SIMPLE"
  description = "The plaintext representing the monitor script"
  type        = string
}

variable "public_locations" {
  default     = null
  description = "The public locations the monitor will run from"
  type        = list(string)
}

variable "private_locations" {
  default     = null
  description = "The private locations the monitor will run from"
  type        = list(string)
}

variable "private_location_ids" {
  default     = null
  description = "The private location ids the monitor will run from"
  type        = list(string)
}

variable "validation_string" {
  default     = ""
  description = "Validation text for monitor to search for at given URI"
  type        = string
}

variable "verify_ssl" {
  default     = false
  description = "Monitor should validate SSL certificate chain"
  type        = bool
}

variable "tags" {
  default     = {}
  description = "The tags that will be associated with the monitor"
  type        = map(list(string))
}

variable "treat_redirect_as_failure" {
  default     = false
  description = "Categorize redirects during a monitor job as a failure"
  type        = bool
}

variable "bypass_head_request" {
  default     = false
  description = "Monitor should skip default HEAD request and instead use GET verb in check"
  type        = bool
}

variable "enable_screenshot_on_failure_and_script" {
  default     = false
  description = "Capture a screenshot during job execution"
  type        = bool
}

variable "script_language" {
  default     = ""
  description = "The programing language that should execute the script"
  type        = string
}

variable "runtime_type" {
  default     = ""
  description = "The runtime that the monitor will use to run jobs"
  type        = string
}

variable "runtime_version" {
  default     = ""
  description = "The specific version of the runtime type selected"
  type        = string
}

variable "condition" {
  default     = null
  description = "Creates a NRQL Alert Condition for the monitor"
  type = object({
    policy_id   = string
    enabled     = optional(bool, true)
    name        = optional(string, "")
    description = optional(string, "")
    runbook_url = optional(string, "")
    tags        = optional(map(list(string)), {})
  })
}
