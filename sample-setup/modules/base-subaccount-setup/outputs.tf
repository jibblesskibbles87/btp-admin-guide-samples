output "subaccount_id" {
  value       = btp_directory.self.id
  description = "Technical ID of the directory"
}

output "subaccount_name" {
  value       = btp_directory.self.name
  description = "The name of the directory"
}

output "business_unit" {
  value       = var.business_unit
  description = "Business unit of the project e.g., HR, IT or Sales"
}

output "costcenter" {
  value       = var.costcenter
  description = "Cost center to be used for subaccounts"
}

output "stage" {
  value       = var.stage
  description = "The geographical region for a directory. The parameter is optional"
}
