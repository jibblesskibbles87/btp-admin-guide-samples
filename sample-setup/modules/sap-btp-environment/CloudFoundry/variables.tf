variable "subaccount_id" {
  type        = string
  description = "ID of the subaccount where the Cloud Foundry environment will be created."
}
variable "instance_name" {
  type        = string
  description = "Name of the Cloud Foundry environment instance."

  validation {
    condition     = can(regex("^[a-zA-Z0-9_\\-\\.]{1,32}$", var.instance_name))
    error_message = "Please provide a valid instance name (^[a-zA-Z0-9_\\-\\.]{1,32})."
  }
}

variable "plan_name" {
  type        = string
  description = "Desired service plan for the Cloud Foundry environment instance."
  default     = "standard"
}

variable "cf_org_name" {
  type        = string
  description = "Name of the Cloud Foundry org."

  validation {
    condition     = can(regex("^.{1,255}$", var.cf_org_name))
    error_message = "The Cloud Foundry org name must not be emtpy and not exceed 255 characters."
  }
}
