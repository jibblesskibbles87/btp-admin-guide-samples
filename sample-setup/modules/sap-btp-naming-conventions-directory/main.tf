locals {
  costcenter_label_name         = "Costcenter"
  directory_contact_label_name  = "Directory responsibles"
  managedby_label_name          = "Managed by"

  directory_name = var.region == null ? var.business_unit : format(
    "%s%s%s",
    upper(var.business_unit),
    var.delimiter,
    var.region
  )

  directory_description = var.region == null ? format(
    "Directory for business Unit %s",
    var.business_unit
    ) : format(
    "Directory for business Unit %s (%s)",
    var.business_unit,
    var.region
  )

  costcenter_label_name_formatted         = var.label_name_case == "lower" ? lower(local.costcenter_label_name) : var.label_name_case == "title" ? title(local.costcenter_label_name) : upper(local.costcenter_label_name)
  directory_contact_label_name_formatted  = var.label_name_case == "lower" ? lower(local.directory_contact_label_name) : var.label_name_case == "title" ? title(local.directory_contact_label_name) : upper(local.directory_contact_label_name)
  managedby_label_name_formatted          = var.label_name_case == "lower" ? lower(local.managedby_label_name) : var.label_name_case == "title" ? title(local.managedby_label_name) : upper(local.managedby_label_name)

  costcenter_label_value_formatted = var.label_value_case == "lower" ? lower(var.costcenter) : var.label_value_case == "title" ? title(var.costcenter) : var.label_value_case == "upper" ? upper(var.costcenter) : var.costcenter
  management_label_value_formatted = var.label_value_case == "lower" ? lower(var.management_tool) : var.label_value_case == "title" ? title(var.management_tool) : var.label_value_case == "upper" ? upper(var.management_tool) : var.management_tool

  basic_labels = {
    "${local.costcenter_label_name_formatted}" = [local.costcenter_label_value_formatted]
  }

  basic_labels_final = var.add_managed_by_label ? merge(
    local.basic_labels,
    {
      "${local.managedby_label_name_formatted}" = [local.management_label_value_formatted]
    }
  ) : local.basic_labels

  directory_labels = merge(
    local.basic_labels_final,
    {
      "${local.directory_contact_label_name_formatted}" = var.directory_contacts
    }
  )
}
