output "subaccount_name" {
  value       = local.subaccount_name
  description = "Name of the subaccount"
}

output "subaccount_subdomain" {
  value       = local.subaccount_subdomain
  description = "Subdomain of the subaccount"
}

output "subaccount_description" {
  value       = local.subaccount_description
  description = "Description of the subaccount"
}

output "subaccount_labels" {
  value       = local.subaccount_labels
  description = "Labels for the subaccount"
}

output "subaccount_usage" {
  value       = local.subaccount_usage
  description = "Usage of the subaccount"
}

output "cloudfoundry_org_name" {
  value       = local.cloudfoundry_org_name
  description = "Name of the Cloud Foundry org"
}
