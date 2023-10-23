output "main" {
  value       = newrelic_synthetics_private_location.main.guid
  description = "the id of the private location"
}
