module "subaccount_namings" {
  source              = "../sap-btp-naming-conventions-subaccount"
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
  labels      = module.subaccount_namings_namings.directory_labels
}
