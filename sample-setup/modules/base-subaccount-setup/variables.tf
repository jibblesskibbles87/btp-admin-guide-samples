variable "business_unit" {
  type        = string
  description = "Business unit of the project e.g., HR, IT or Sales"
}

variable "subaccount_region" {
  type        = string
  description = "Region of the subaccount."
}

variable "costcenter" {
  type        = string
  description = "Cost center to be used for subaccounts"
}

variable "company_name" {
  type        = string
  description = <<-EOT
    Company name to be used for subaccount subdomains. The parameter is optional
    Default value: `null`.
  EOT
  default     = null
}

variable "stage" {
  type        = string
  description = <<-EOT
    Stage of the environment to be setup up.
    Possible values: `Dev`, `Test`, `Prod`, `Shared`.
  EOT
}

variable "subaccount_contacts" {
  type        = list(string)
  description = "Contact persons to be used for subaccount, added as label"
}

variable "parent_id" {
  type        = string
  description = "ID of the parent directory"
  default     = null
}
