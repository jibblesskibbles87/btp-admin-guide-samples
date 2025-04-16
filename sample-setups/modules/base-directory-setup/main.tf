module "dir_namings" {
  source             = "../sap-btp-naming-conventions-directory"
  business_unit      = var.business_unit
  costcenter         = var.costcenter
  directory_contacts = var.directory_contacts
  region             = var.region
}


resource "btp_directory" "self" {
  name        = module.dir_namings.directory_name
  description = module.dir_namings.directory_description
  labels      = module.dir_namings.directory_labels
}
