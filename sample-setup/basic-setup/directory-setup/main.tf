module "directory" {
  source             = "../../modules/base-directory-setup"
  for_each           = var.directory_inputs
  business_unit      = each.value.business_unit
  costcenter         = each.value.costcenter
  directory_contacts = each.value.directory_contacts
  region             = each.value.region
}
