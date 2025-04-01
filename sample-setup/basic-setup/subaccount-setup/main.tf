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
