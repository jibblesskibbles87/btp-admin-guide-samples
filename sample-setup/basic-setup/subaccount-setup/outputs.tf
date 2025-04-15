output "subaccount_url" {
  value       = "https://emea.cockpit.btp.cloud.sap/cockpit/#globalaccount/${data.btp_globalaccount.this.id}/subaccount/${btp_subaccount.project_subaccount.id}"
  description = "The URL to the provisioned subaccount on SAP BTP"
}

output "cf_api_url" {
  value       = module.cf_environment.cf_api_url
  description = "The Cloud Foundry API URL"
}

output "cf_org_id" {
  value       = module.cf_environment.cf_org_id
  description = "The Cloud Foundry org ID"
}
