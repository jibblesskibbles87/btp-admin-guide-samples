data "btp_regions" "all" {}

data "btp_subaccount" "this" {
  id = var.subaccount_id
}

locals {
  subaccount_iaas_provider = [for region in data.btp_regions.all.values : region if region.region == data.btp_subaccount.this.region][0].iaas_provider
}

resource "btp_subaccount_entitlement" "kymaruntime" {
  subaccount_id = var.instance_name
  service_name  = "kymaruntime"
  plan_name     = var.plan_name != null ? var.plan_name : lower(local.subaccount_iaas_provider)
  amount        = 1
}

resource "btp_subaccount_environment_instance" "kymaruntime" {
  subaccount_id    = var.subaccount_id
  name             = var.instance_name
  environment_type = "kyma"
  service_name     = btp_subaccount_entitlement.kymaruntime.service_name
  plan_name        = btp_subaccount_entitlement.kymaruntime.plan_name
  parameters = jsonencode(merge({
    name           = var.instance_name
    administrators = toset(var.kyma_administrators)
    },
    var.oidc == null ? null : {
      issuerURL      = var.oidc.issuer_url
      clientID       = var.oidc.client_id
      groupsClaim    = var.oidc.groups_claim
      usernameClaim  = var.oidc.username_claim
      usernamePrefix = var.oidc.username_prefix
      signingAlgs    = var.oidc.signing_algs
  }))

  depends_on = [btp_subaccount_entitlement.kymaruntime]

  timeouts = {
    read   = "10m"
    create = "60m"
    update = "60m"
    delete = "120m"
  }
}
