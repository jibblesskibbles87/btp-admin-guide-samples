output "kyma_dashboard_url" {
  value       = btp_subaccount_environment_instance.kymaruntime.dashboard_url
  description = "The URL to the Kyma dashboard"
}

output "kyma_kubeconfig_url" {
  value       = jsondecode(btp_subaccount_environment_instance.kymaruntime.labels)["KubeconfigURL"]
  description = "The URL to the Kubeconfig file for the Kyma runtime"
}
