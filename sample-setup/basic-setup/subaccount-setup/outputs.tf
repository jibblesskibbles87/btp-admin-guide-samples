output "subaccount_id" {
  value       = btp_subaccount.self.id
  description = "Technical ID of the subaccount"
}

output "subaccount_name" {
  value       = btp_subaccount.self.name
  description = "The name of the subaccount"
}
