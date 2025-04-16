# Setup of a Subaccount

## Assumptions

- We assume a basic setup of a subaccount is executed by the platform team/ SAP BTP administrator team
- We assume that the responsibility of the platform team is restricted to a basic setup of a subaccount leaving out app subscriptions and service instance creation.

## Design Decisions

To keep the Terraform state files clearly separated the setup is done per subaccount i.e. per stage.

## Subaccount Setup

The setup of the subaccount comprises:

- The setup of a subaccount in accordance to the naming conventions and labeling strategy of the company
- The trust configuration to a custom IdP is configured by default.
- Default entitlements are added depending on the stage. In addition the requesting team can add additional project specific entitlements ("à la carte entitlements")
- Optionally a Cloud Foundry Environment is created

### Naming Conventions and Labels

The naming conventions and labels are centralized in the module [sap-btp-naming-conventions-subaccount](../../modules/sap-btp-naming-conventions-subaccount/README.md). The names and labels are derived based on input variables defined in the [variables.tf](./variables.tf) file.

### Validations for Geographies and BTP Regions

According to the SAP BTP Administrators Guide one part of the naming is the geographical region. To ensure that this region fits to the subaccount region, a validation is implemented in the [variables.tf](./variables.tf) file. The validation checks if the region of the subaccount is part of the geographical region. The geographical regions are defined in a local variables defined in the [main.tf](main.tf) file.

### Setup of Entitlements

The setup of entitlements is split into two parts:

- The default entitlements that are defined per stage and sourced from the module [](../../modules/sap-btp-subaccount-default-entitlements/README.md)
- Optional additional entitlements that might be needed due to project specific requirements. These entitlements are defined in the [variables.tf](./variables.tf) file

The configuration merges the two files and adds the entitlements to the subaccount.

To ease the provisioning of entitlements we use the Terraform community module [SAP BTP Entitlements Management with Terraform Module: sap-btp-entitlements](https://registry.terraform.io/modules/aydin-ozcan/sap-btp-entitlements/btp/latest).

### Setup of Cloud Foundry Environment

The setup of a Cloud Foundry environment is optional. The caller can decide if a Cloud Foundry environment is required or not e.g. when setting up a shared subaccount. The boolean variable is `provision_cf_environment` in the [variables.tf](./variables.tf) file.


### Output

The output defined in the [outputs.tf](./outputs.tf) file returns the main information relevant for the development team namely:

- a link to the subaccount
- The ID of the Cloud Foundry org
- The API endpoint of the Cloud Foundry environment



## SAP BTP Administrator's Guide - References

- [Setting Up Your Account Model](https://help.sap.com/docs/btp/btp-admin-guide/setting-up-your-account-model)
- [Naming and Directory Templates](https://help.sap.com/docs/btp/btp-admin-guide/naming-directory-templates)
- [Setting Up Authentication](https://help.sap.com/docs/btp/btp-admin-guide/setting-up-authentication)
- [Cloud Foundry, Kyma, or Both?](https://help.sap.com/docs/btp/btp-admin-guide/cloudfoundry-kyma-or-both)
