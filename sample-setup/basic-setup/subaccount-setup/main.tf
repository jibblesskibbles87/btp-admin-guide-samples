locals {
  valid_region_combination = {
    eu10 = "EMEA"
    eu11 = "EMEA"
    eu20 = "EMEA"
    eu30 = "EMEA"
    us10 = "AMER"
    us11 = "AMER"
    us20 = "AMER"
    us21 = "AMER"
    us30 = "AMER"
    ap10 = "APAC"
    ap11 = "APAC"
    ap12 = "APAC"
    ap20 = "APAC"
    ap12 = "APAC"
    ap30 = "APAC"
  }
}

data "btp_globalaccount" "this" {}

module "subaccount_namings" {
  source              = "../../modules/sap-btp-naming-conventions-subaccount"
  business_unit       = var.business_unit
  costcenter          = var.costcenter
  stage               = var.stage
  subaccount_contacts = var.subaccount_contacts
}

resource "btp_subaccount" "self" {
  parent_id   = var.parent_id
  name        = module.subaccount_namings.subaccount_name
  subdomain   = module.subaccount_namings.subaccount_subdomain
  region      = var.subaccount_region
  description = module.subaccount_namings.subaccount_description
  usage       = module.subaccount_namings.subaccount_usage
  labels      = module.subaccount_namings.subaccount_labels
}

resource "btp_subaccount_trust_configuration" "custom_idp" {
  subaccount_id            = btp_subaccount.self.id
  identity_provider        = var.custom_indentity_provider
  name                     = "default-corp-custom-idp"
  description              = "Default Custom IdP of Corporate"
  auto_create_shadow_users = true
  available_for_user_logon = true
}

module "subaccount_default_entitlements" {
  source = "../../modules/sap-btp-subaccount-default-entitlements"

  stage = var.stage
}

locals {
  finalized_entitlements = var.additional_entitlements == {} ? module.subaccount_default_entitlements.default_entitlements_for_stage : merge(
    module.subaccount_default_entitlements.default_entitlements_for_stage,
    var.additional_entitlements
  )
}

module "sap_btp_entitlements" {

  source  = "aydin-ozcan/sap-btp-entitlements/btp"
  version = "~> 1.0.1"

  subaccount   = btp_subaccount.self.id
  entitlements = local.finalized_entitlements
}

module "cf_environment" {
  source = "../../modules/sap-btp-environment/CloudFoundry"

  count = var.provision_cf_environment ? 1 : 0

  subaccount_id = btp_subaccount.self.id
  instance_name = module.subaccount_namings.cloudfoundry_org_name
  cf_org_name   = module.subaccount_namings.cloudfoundry_org_name
}
