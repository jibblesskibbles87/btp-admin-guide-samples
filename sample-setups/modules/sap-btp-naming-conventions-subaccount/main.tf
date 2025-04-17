resource "random_uuid" "self" {
}

locals {
  # The length limit for the subdomain is 63 characters.
  subdomain_length_limit        = 63
  costcenter_label_name         = "Costcenter"
  subaccount_contact_label_name = "Subaccount responsibles"
  stage_label_name              = "Stage"
  managedby_label_name          = "Managed by"

  costcenter_label_name_formatted         = var.label_name_case == "lower" ? lower(local.costcenter_label_name) : var.label_name_case == "title" ? title(local.costcenter_label_name) : upper(local.costcenter_label_name)
  subaccount_contact_label_name_formatted = var.label_name_case == "lower" ? lower(local.subaccount_contact_label_name) : var.label_name_case == "title" ? title(local.subaccount_contact_label_name) : upper(local.subaccount_contact_label_name)
  stage_label_name_formatted              = var.label_name_case == "lower" ? lower(local.stage_label_name) : var.label_name_case == "title" ? title(local.stage_label_name) : upper(local.stage_label_name)
  managedby_label_name_formatted          = var.label_name_case == "lower" ? lower(local.managedby_label_name) : var.label_name_case == "title" ? title(local.managedby_label_name) : upper(local.managedby_label_name)

  costcenter_label_value_formatted = var.label_value_case == "lower" ? lower(var.costcenter) : var.label_value_case == "title" ? title(var.costcenter) : var.label_value_case == "upper" ? upper(var.costcenter) : var.costcenter
  stage_label_value_formatted      = var.label_value_case == "lower" ? lower(var.stage) : var.label_value_case == "title" ? title(var.stage) : var.label_value_case == "upper" ? upper(var.stage) : var.stage
  management_label_value_formatted = var.label_value_case == "lower" ? lower(var.management_tool) : var.label_value_case == "title" ? title(var.management_tool) : var.label_value_case == "upper" ? upper(var.management_tool) : var.management_tool

  basic_labels = {
    "${local.costcenter_label_name_formatted}" = [local.costcenter_label_value_formatted]
    "${local.stage_label_name_formatted}"      = [local.stage_label_value_formatted]
  }

  basic_labels_final = var.add_managed_by_label ? merge(
    local.basic_labels,
    {
      "${local.managedby_label_name_formatted}" = [local.management_label_value_formatted]
    }
  ) : local.basic_labels

  subaccount_name = format(
    "%s%s%s",
    lower(var.business_unit),
    var.delimiter,
    lower(var.stage)
  )

  subaccount_subdomain_base = var.company_name == null ? format(
    "%s%s%s",
    lower(var.business_unit),
    var.delimiter,
    lower(var.stage)
    ) : format(
    "%s%s%s%s%s",
    lower(var.company_name),
    var.delimiter,
    lower(var.business_unit),
    var.delimiter,
    lower(var.stage)
  )

  subaccount_sudomain_with_UUID = format(
    "%s%s%s",
    local.subaccount_subdomain_base,
    var.delimiter,
    random_uuid.self.id
  )

  subaccount_subdomain = length(local.subaccount_sudomain_with_UUID) > local.subdomain_length_limit ? substr(
    local.subaccount_sudomain_with_UUID,
    0,
    local.subdomain_length_limit
  ) : local.subaccount_sudomain_with_UUID


  subaccount_description = format(
    "Subaccount for Business Unit %s (%s)",
    upper(var.business_unit),
    title(lower(var.stage))
  )

  subaccount_labels = merge(
    local.basic_labels_final,
    {
      "${local.subaccount_contact_label_name_formatted}" = var.subaccount_contacts
    }
  )

  subaccount_usage = var.stage == "Prod" ? "USED_FOR_PRODUCTION" : "NOT_USED_FOR_PRODUCTION"

  cloudfoundry_org_name = local.subaccount_name

  // We assume that one Kyma instance is created for Dev and Test
  kyma_stage = var.stage == "Dev" ? "Dev-Test" : var.stage == "Test" ? "Dev-Test" : var.stage == "Prod" ? "Prod" : "Shared"

  kyma_instance_name = format(
    "%s%s%s",
    lower(var.business_unit),
    var.delimiter,
    lower(local.kyma_stage)
  )
}
