# Terraform Samples for SAP BTP Administrator's Guide

## Paradigms

We follow the paradigms of a simple and clear Terraform configuration as laid out in [Simple, Clear, Maintainable](https://rosesecurity.dev/blog/2024/11/24/terraform-proverbs); especially:

- Clear is better than clever.
- Modules should be reusable, not rigid.
- Outputs are for sharing.
- Labels are free; use them liberally.
- Descriptions are for users.
- Use positive variable names to avoid double negatives.
- Name with underscores, not dashes.
- Using locals makes code descriptive and maintainable.

## Naming Conventions and Labeling

Consistent naming conventions are one import aspect when provisioning and managing your SAP BTP account. Our samples follow the [Naming Conventions for SAP BTP Accounts](https://help.sap.com/docs/btp/btp-admin-guide/naming-conventions-for-sap-btp-accounts).

To ensure consistent naming of your resources, we encapsulate the guidelines in a dedicated module. Besides the naming, we also include the labels that can be attached to some resources on SAP BTP.

We have created one module for the level of the [directory](./modules/sap-btp-naming-conventions-directory/README.md) and one for the level of the [subaccount](./modules/sap-btp-naming-conventions-subaccount/README.md).

## Setup of Directories

The folder `basic-setup/directory-setup` contains the setup of directories as a structuring element for the subaccounts. For details, see [README.md](./basic-setup/directory-setup/README.md).

## Setup of Subaccounts

The folder `basic-setup/subaccount-setup` contains the setup of subaccounts. For details, see the [README.md](./basic-setup/subaccount-setup/README.md) file.
