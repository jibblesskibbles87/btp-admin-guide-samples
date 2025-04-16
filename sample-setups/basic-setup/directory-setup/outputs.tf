output "directories" {
  value = {
    for k, v in module.directory : k => {
      id            = v.directory_id
      name          = v.directory_name
      business_unit = v.business_unit
      costcenter    = v.costcenter
      region        = v.region
    }
  }
}
