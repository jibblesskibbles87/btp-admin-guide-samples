data "btp_subaccount_environments" "all" {
  subaccount_id = var.subaccount_id
}

resource "null_resource" "cache_target_environment" {
  triggers = {
    label = [for env in data.btp_subaccount_environments.all.values : env if env.service_name == "cloudfoundry" && env.environment_type == "cloudfoundry"][0].landscape_label
  }

  lifecycle {
    ignore_changes = all
  }
}

resource "btp_subaccount_environment_instance" "self" {
  subaccount_id    = var.subaccount_id
  name             = var.instance_name
  environment_type = "cloudfoundry"
  service_name     = "cloudfoundry"
  plan_name        = var.plan_name
  landscape_label  = null_resource.cache_target_environment.triggers.label

  parameters = jsonencode({
    instance_name = var.cf_org_name
  })
}
