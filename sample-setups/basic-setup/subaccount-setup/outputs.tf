output "subaccount_url" {
  value       = "https://emea.cockpit.btp.cloud.sap/cockpit/#globalaccount/${data.btp_globalaccount.this.id}/subaccount/${btp_subaccount.self.id}/overview"
  description = "The URL to the provisioned subaccount on SAP BTP"
}

output "cf_api_url" {
  value       = var.provision_cf_environment ? module.cf_environment[0].cf_api_url : "No Cloud Foundry environment was requested to be provisioned"
  description = "The Cloud Foundry API URL"
}

output "cf_org_id" {
  value       = var.provision_cf_environment ? module.cf_environment[0].cf_org_id : "No Cloud Foundry environment was requested to be provisioned"
  description = "The Cloud Foundry org ID"
}

output "kyma_dashboard_url" {
  value       = var.provision_kyma_environment ? module.kyma_environment[0].kyma_dashboard_url : "No Kyma environment was requested to be provisioned"
  description = "The URL to the Kyma dashboard"
}

output "kyma_kubeconfig_url" {
  value       = var.provision_kyma_environment ? module.kyma_environment[0].kyma_kubeconfig_url : "No Kyma environment was requested to be provisioned"
  description = "The URL to the Kubeconfig file for the Kyma runtime"
}
