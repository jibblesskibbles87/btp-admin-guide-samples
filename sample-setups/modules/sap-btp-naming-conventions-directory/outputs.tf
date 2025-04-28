output "directory_name" {
  value       = local.directory_name
  description = "Name of the directory"
}

output "directory_description" {
  value       = local.directory_description
  description = "Description of the directory"
}

output "directory_labels" {
  value       = local.directory_labels
  description = "Labels for the directory"
}

output "business_unit" {
  value       = var.business_unit
  description = "Business unit of the project, such as HR, IT, or Sales"
}

output "costcenter" {
  value       = var.costcenter
  description = "Cost center to be used for subaccounts"
}

output "region" {
  value       = var.region
  description = "The geographical region for a directory. The parameter is optional"
}
