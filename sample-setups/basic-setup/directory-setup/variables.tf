variable "globalaccount" {
  type        = string
  description = "The subdomain of the global account on SAP BTP"
}

variable "directory_inputs" {
  type = map(object({
    business_unit      = string
    costcenter         = string
    directory_contacts = list(string)
    region             = string
  }))
  description = <<-EOT
    The inputs for the directory module.
    - `business_unit`: Business unit of the project, such as HR, IT, or Sales
    - `costcenter`: Cost center to be used for subaccounts
    - `directory_contacts`: Contact persons to be used for directories, added as label
    - `region`: The geographical region for a directory. The parameter is optional
      If you set it the possible values are: `EMEA`, `APAC`, `AMER`.
      Default value: `null`.
  EOT
}
