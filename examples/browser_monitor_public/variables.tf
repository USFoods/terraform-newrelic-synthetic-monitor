variable "account_id" {
  description = "The id of the account where where the synthetic monitor lives"
  type        = string
}

variable "enabled" {
  default     = false
  description = "The run state of the monitor"
  type        = bool
}
