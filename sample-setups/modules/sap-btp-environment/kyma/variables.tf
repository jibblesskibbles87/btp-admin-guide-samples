variable "subaccount_id" {
  type        = string
  description = "ID of the subaccount where the Kyma runtime is created."
}

variable "instance_name" {
  type        = string
  description = "Name of the Kyma runtime instance."

  validation {
    condition     = can(regex("^[a-zA-Z0-9_\\-\\.]{1,32}$", var.instance_name))
    error_message = "Please provide a valid instance name (^[a-zA-Z0-9_\\-\\.]{1,32})."
  }
}

variable "plan_name" {
  type        = string
  description = <<-EOT
     Desired service plan for the Kyma runtime instance.
     If not provided it will be set to the default value of the region.
     EOT
  default     = null
}

variable "kyma_administrators" {
  description = "Users to be assigned as administrators."
  type        = list(string)
  default     = []
}

variable "oidc" {
  description = "Custom OpenID Connect IdP configuration to authenticate users in your Kyma runtime."
  type = object({
    # the URL of the OpenID issuer (use the HTTPS schema)
    issuer_url = string

    # the client ID for the OpenID client
    client_id = string

    #the name of a custom OpenID Connect claim for specifying user groups
    groups_claim = string

    # the list of allowed cryptographic algorithms used for token signing. The allowed values are defined by RFC 7518.
    signing_algs = set(string)

    # the prefix for all usernames. If you don't provide it, username claims other than “email” are prefixed by the issuerURL to avoid clashes. To skip any prefixing, provide the value as -.
    username_prefix = string

    # the name of a custom OpenID Connect claim for specifying a username
    username_claim = string
  })
  default = null
}
