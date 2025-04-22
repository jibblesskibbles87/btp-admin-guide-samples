# Setup of a Subaccount

## Assumptions

- We assume a basic setup of a subaccount is executed by your organization's SAP BTP administrator team, Platform Engineering Team, or Center of Expertise. For details, see [Building Teams](https://help.sap.com/docs/btp/btp-admin-guide/building-teams?locale=en-US&version=Cloud#platform-engineering-team-center-of-excellence).
- We assume that the responsibility of the Platform Engineering Team is restricted to a basic setup of a subaccount, excluding creation of app subscriptions or service instances.

## Design Decisions

To keep the Terraform state files clearly separated, the setup is done per subaccount, that is, per development stage.

## Subaccount Setup

The setup of the subaccount comprises the following steps:

1. The setup of a subaccount following the naming conventions and labeling strategy of your company.
2. The trust configuration to a custom IdP is configured by default.
3. Depending on the development stage, default entitlements are added. In addition, the requesting team can add project-specific entitlements ("à la carte entitlements").
4. Optionally, a Cloud Foundry Environment is created.

### Naming Conventions and Labels

The naming conventions and labels are centralized in the module [sap-btp-naming-conventions-subaccount](../../modules/sap-btp-naming-conventions-subaccount/README.md). The input variables (see [variables.tf](./variables.tf)) define the names and labels.

### Validations for Geographies and SAP BTP Regions

You can include the geographical region in your naming conventions. To ensure that this region fits to the subaccount region, the [variables.tf](./variables.tf) file validates if the region of the subaccount is part of the geographical region. The geographical regions are defined as local variables in the [main.tf](main.tf) file.

### Setup of Entitlements

The setup of entitlements is split into two files:

- The default entitlements that are defined per development stage and sourced from the module (see [SAP BTP - Default Subaccount Entitlements](../../modules/sap-btp-subaccount-default-entitlements/README.md)).
- Optional additional entitlements, depending on project-specific requirements. These entitlements are defined in the [variables.tf](./variables.tf) file

The configuration merges the two files and adds the entitlements to the subaccount.

For easier provisioning of entitlements, we use the Terraform community module [SAP BTP Entitlements Management with Terraform Module: sap-btp-entitlements](https://registry.terraform.io/modules/aydin-ozcan/sap-btp-entitlements/btp/latest).

### Setup of SAP BTP, Cloud Foundry Runtime

The setup of a Cloud Foundry runtime is optional. The caller can decide if a Cloud Foundry runtime is required or not, for example, when setting up a shared subaccount. The Boolean variable is `provision_cf_environment` in the [variables.tf](./variables.tf) file.

The setup is configured in the corresponding module [`sap-btp-environment/cloudfoundry`](../../modules/sap-btp-environment/cloudfoundry/README.md).

### Setup of SAP BTP, Kyma Runtime

The setup of a Kyma runtime is optional. The caller can decide if a Kyma runtime is required or not, for example, when setting up a shared subaccount. The Boolean variable is `provision_kyma_environment` in the [variables.tf](./variables.tf) file.

If the Kyma runtime is requested, the users that should be assigned as administrators must be entered in the variable `kyma_administrators` in the [variables.tf](./variables.tf) file. This condition is validated.

The setup is configured in the corresponding module [`sap-btp-environment/kyma`](../../modules/sap-btp-environment/kyma/README.md).

### Output

The output defined in the [outputs.tf](./outputs.tf) file returns the main information relevant for the development team, such as:

- A link to the subaccount
- If a Cloud Foundry runtime is created, the ID of the Cloud Foundry org
- If a Cloud Foundry runtime is created, the API endpoint of the Cloud Foundry environment
- If a Kyma runtime is created, the URL to the Kyma dashboard
- If a Kyma runtime is created, the URL to the Kubeconfig file for the Kyma runtime

## SAP BTP Administrator's Guide - References

- [Setting Up Your Account Model](https://help.sap.com/docs/btp/btp-admin-guide/setting-up-your-account-model)
- [Naming and Directory Templates](https://help.sap.com/docs/btp/btp-admin-guide/naming-directory-templates)
- [Setting Up Authentication](https://help.sap.com/docs/btp/btp-admin-guide/setting-up-authentication)
- [Cloud Foundry, Kyma, or Both?](https://help.sap.com/docs/btp/btp-admin-guide/cloudfoundry-kyma-or-both)
