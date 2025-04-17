output "cf_api_url" {
  value       = jsondecode(btp_subaccount_environment_instance.self.labels)["API Endpoint"]
  description = "The Cloud Foundry API URL"
}

output "cf_org_id" {
  value       = jsondecode(btp_subaccount_environment_instance.self.labels)["Org ID"]
  description = "The Cloud Foundry org ID"
}
