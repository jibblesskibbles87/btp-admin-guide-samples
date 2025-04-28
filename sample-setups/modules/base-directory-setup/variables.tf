variable "business_unit" {
  type        = string
  description = "Business unit of the project, such as HR, IT, or Sales"
}

variable "region" {
  type        = string
  default     = null
  description = <<-EOT
    The geographical region for a directory. The parameter is optional
    If you set it the possible values are: `EMEA`, `APAC`, `AMER`.
    Default value: `null`.
  EOT
}

variable "costcenter" {
  type        = string
  description = "Cost center to be used for subaccounts"
}

variable "directory_contacts" {
  type        = list(string)
  description = "Contact persons to be used for the directory, added as label"
}
